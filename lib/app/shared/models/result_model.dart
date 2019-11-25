import 'package:meta/meta.dart';

class ResultModel {
  double _percentage; // porcentagem
  double _plannedValue; // valor planejado
  double _addedValue; // valor agregado
  double _deadlineIndex; // indice de prazo
  double _costIndex; // indixe de custo

  ResultModel({
    @required double percentage,
    @required double plannedValue,
    @required double addedValue,
    @required double deadlineIndex,
    @required double costIndex,
  })  : _percentage = percentage,
        _plannedValue = plannedValue,
        _addedValue = addedValue,
        _deadlineIndex = deadlineIndex,
        _costIndex = costIndex;

  String get percentage => _percentage.toStringAsFixed(2);

  String get plannedValue => _plannedValue.toStringAsFixed(2);

  String get addedValue => _addedValue.toStringAsFixed(2);

  String get deadlineIndex => _deadlineIndex.toStringAsFixed(2);
  bool get isLate => _deadlineIndex < 1;

  String get costIndex => _costIndex.toStringAsFixed(2);
  bool get isOverCost => _costIndex < 1;
}
