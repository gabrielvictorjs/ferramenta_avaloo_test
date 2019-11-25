import 'package:flutter_test/flutter_test.dart';

import 'package:ferramenta_avaloo/app/shared/services/calculations_service.dart';

void main() {
  CalculationsService service;

  setUp(() {
    service = CalculationsService();
  });

  group('CalcuationsService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<CalculationsService>());
    });
  });
}
