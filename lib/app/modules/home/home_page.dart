import 'package:flutter/material.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';
import 'utils/input_form_fields.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title = "Insira os dados"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBloc = AppModule.to.getBloc<AppBloc>();
  final _inputForm = InputFormFields();

  bool totalBudgetValidate = false;
  bool budgetSpentValidate = false;
  bool plannedDeadlineValidate = false;
  bool deadlineMetValidate = false;

  void _handleSubmit() {
    _appBloc.calculate(_inputForm.fields);
    Navigator.pushNamed(context, "result");
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _resetValidates() {
    setState(() {
      totalBudgetValidate = false;
      budgetSpentValidate = false;
      plannedDeadlineValidate = false;
      deadlineMetValidate = false;
    });
  }

  void _clearFields() {
    _inputForm.clean();
    _resetValidates();
    _hideKeyboard();
  }

  @override
  Widget build(BuildContext context) {
    bool _isFull = totalBudgetValidate &&
        budgetSpentValidate &&
        plannedDeadlineValidate &&
        deadlineMetValidate;

    return GestureDetector(
      onTap: _hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            _buildCleanAction(),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCustomTextField(
                  hintText: "Orçamento Total",
                  controller: _inputForm.totalBudgetController,
                  onChanged: (text) {
                    setState(() => totalBudgetValidate = text.isNotEmpty);
                  },
                ),
                _buildCustomTextField(
                  hintText: "Orçamento Gasto",
                  controller: _inputForm.budgetSpentController,
                  onChanged: (text) {
                    setState(() => budgetSpentValidate = text.isNotEmpty);
                  },
                ),
                _buildCustomTextField(
                  hintText: "Prazo Planejado",
                  controller: _inputForm.plannedDeadlineController,
                  onChanged: (text) {
                    setState(() => plannedDeadlineValidate = text.isNotEmpty);
                  },
                ),
                _buildCustomTextField(
                  hintText: "Prazo Cumprido",
                  controller: _inputForm.deadlineMetController,
                  onChanged: (text) {
                    setState(() => deadlineMetValidate = text.isNotEmpty);
                  },
                ),
                _buildCustomButton(
                  disabled: !_isFull,
                  onPressed: _handleSubmit,
                  title: "Calcular",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCleanAction() {
    return MediaQuery.of(context).viewInsets.bottom != 0
        ? IconButton(
            onPressed: _clearFields,
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          )
        : Container();
  }

  Widget _buildCustomTextField({
    @required String hintText,
    @required TextEditingController controller,
    void Function(String) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 22),
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    @required String title,
    @required Function onPressed,
    bool disabled = false,
  }) {
    assert(title != null);

    return Container(
      margin: EdgeInsets.only(top: 8),
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: !disabled ? Colors.green : Colors.grey,
        elevation: 0,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
