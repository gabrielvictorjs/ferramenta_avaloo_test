import 'package:flutter/material.dart';

import '../../../shared/models/input_model.dart';

class InputFormFields {
  final totalBudgetController = TextEditingController();
  final budgetSpentController = TextEditingController();
  final plannedDeadlineController = TextEditingController();
  final deadlineMetController = TextEditingController();

  void clean() {
    totalBudgetController.clear();
    budgetSpentController.clear();
    plannedDeadlineController.clear();
    deadlineMetController.clear();
  }

  InputModel get fields => InputModel(
        totalBudget: double.tryParse(totalBudgetController.text) ?? 0,
        budgetSpent: double.tryParse(budgetSpentController.text) ?? 0,
        plannedDeadline: double.tryParse(plannedDeadlineController.text) ?? 0,
        deadlineMet: double.tryParse(deadlineMetController.text) ?? 0,
      );
}
