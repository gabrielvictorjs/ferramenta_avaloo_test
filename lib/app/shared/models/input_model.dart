import 'package:flutter/material.dart';

class InputModel {
  double _totalBudget; // orcamento total
  double _budgetSpent; // orcamento gasto
  double _plannedDeadline; // prazo planejado
  double _deadlineMet; // prazo cumprido

  InputModel({
    @required double totalBudget,
    @required double budgetSpent,
    @required double plannedDeadline,
    @required double deadlineMet,
  })  : _totalBudget = totalBudget,
        _budgetSpent = budgetSpent,
        _plannedDeadline = plannedDeadline,
        _deadlineMet = deadlineMet;

  double get totalBudget => _totalBudget;
  double get budgetSpent => _budgetSpent;
  double get plannedDeadline => _plannedDeadline;
  double get deadlineMet => _deadlineMet;
}
