import 'package:flutter_test/flutter_test.dart';

import 'package:custom_error/custom_error.dart';

void main() {
  test('sets and get errors', () {
    String error100 = 'error 100';
    int errorCode100 = 100;
    String error200 = 'error 200';
    int errorCode200 = 200;

    List<Map<String, dynamic>> errors = [
      {'code': errorCode100, 'error': error100},
      {'code': errorCode200, 'error': error200}
    ];

    CustomError customError = CustomError();
    CustomError customError2 = CustomError();
    customError.setError(errorCode100, error100);
    expect(customError.getError(), error100);
    expect(customError.getErrorCode(), errorCode100);

    customError.addError(errorCode100, error100);
    customError.addError(errorCode200, error200);
    expect(customError.getError(), error200);
    expect(customError.getErrorCode(), errorCode200);
    expect(customError.isAnError(), true);
    expect(customError.hasAnError(), true);
    expect(customError2.isAnError(), false);
    expect(customError2.hasAnError(), false);
    expect(customError.getAllErrors(), errors);
  });
}
