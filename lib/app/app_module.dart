import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'app_bloc.dart';
import 'app_widget.dart';
import 'shared/services/calculations_service.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => AppBloc(
            calculationsService: i.get<CalculationsService>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => CalculationsService()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
