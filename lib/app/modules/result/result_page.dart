import 'package:flutter/material.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';
import '../../shared/models/result_model.dart';

class ResultPage extends StatefulWidget {
  final String title;
  ResultPage({Key key, this.title = "Resultados"}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _appBloc = AppModule.to.getBloc<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<ResultModel>(
        stream: _appBloc.outResult,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final _result = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCustomText(
                "Valor Planejado: ${_result.plannedValue}",
              ),
              _buildCustomText(
                "Valor Agregado: ${_result.addedValue}",
              ),
              _buildCustomText(
                "Indice de Custo: ${_result.costIndex}",
              ),
              _buildCustomText(
                "Indice de Prazo: ${_result.deadlineIndex}",
              ),
              SizedBox(height: 15),
              _buildCustomText(
                _result.isLate ? "Atrasado": "Adiantado",
              ),
              _buildCustomText(
                _result.isOverCost ? "Acima do custo": "Abaixo do custo",
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCustomText(String text) {
    assert(text != null);
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
