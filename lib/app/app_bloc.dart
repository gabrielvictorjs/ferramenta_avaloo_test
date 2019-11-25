import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import 'shared/models/input_model.dart';
import 'shared/models/result_model.dart';
import 'shared/services/calculations_service.dart';

class AppBloc extends BlocBase {
  final CalculationsService _calculationsService;

  AppBloc({@required CalculationsService calculationsService})
      : _calculationsService = calculationsService;

  final _resultController = BehaviorSubject<ResultModel>();
  Observable<ResultModel> get outResult => _resultController.stream;

  void calculate(InputModel inputValues) {
    _resultController.add(_calculationsService.calculateAll(inputValues));
  }

  @override
  void dispose() {
    _resultController.close();
    super.dispose();
  }
}
