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

  double get percentage => _percentage;

  double get plannedValue => _plannedValue;

  double get addedValue => _addedValue;

  double get deadlineIndex => _deadlineIndex;
  bool get isLate => _deadlineIndex < 1;

  double get costIndex => _costIndex;
  bool get isOverCost => _costIndex < 1;
}
