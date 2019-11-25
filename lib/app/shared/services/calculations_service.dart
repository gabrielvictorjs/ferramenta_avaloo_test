import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meta/meta.dart';

import '../models/input_model.dart';
import '../models/result_model.dart';

class CalculationsService extends Disposable {
  /// Caculo total.
  ResultModel calculateAll(InputModel inputValues) {
    final _percentage = calculatePercentage(
      deadlineMet: inputValues.deadlineMet,
      plannedDeadline: inputValues.plannedDeadline,
    );

    final _plannedValue = calculatePlannedValue(
      totalBudget: inputValues.totalBudget,
      plannedDeadline: inputValues.plannedDeadline,
    );

    final _addedValue = calculateAddedValue(
      totalBudget: inputValues.totalBudget,
      percentage: _percentage,
    );

    final _deadlineIndex = calculateDeadlineIndex(
      addedValue: _addedValue,
      plannedValue: _plannedValue,
    );

    final _costIndex = calculateCostIndex(
      addedValue: _addedValue,
      totalBudget: inputValues.totalBudget,
    );

    return ResultModel(
      percentage: _percentage,
      plannedValue: _plannedValue,
      addedValue: _addedValue,
      deadlineIndex: _deadlineIndex,
      costIndex: _costIndex,
    );
  }

  /// Calculo da porcentagem.
  double calculatePercentage({
    @required double deadlineMet,
    @required double plannedDeadline,
  }) {
    return deadlineMet * 100 / plannedDeadline;
  }

  /// Calculo do valor planejado `VP`.
  double calculatePlannedValue({
    @required double totalBudget,
    @required double plannedDeadline,
  }) {
    return totalBudget;
  }

  /// Calculo do valor agregado `VA`.
  double calculateAddedValue({
    @required double totalBudget,
    @required double percentage,
  }) {
    return totalBudget * (percentage / 100);
  }

  /// Calculo do indice de prazo `IDP`.
  double calculateDeadlineIndex({
    @required double addedValue,
    @required double plannedValue,
  }) {
    return addedValue / plannedValue;
  }

  double calculateCostIndex({
    @required double addedValue,
    @required double totalBudget,
  }) {
    return addedValue / totalBudget;
  }

  @override
  void dispose() {}
}
