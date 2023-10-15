import 'package:flutter_test/flutter_test.dart';

import 'package:custom_error/custom_error.dart';

void main() {
  test('sets and get errors', () {
    String error100 = 'error 100';
    int errorCode100 = 100;
    String error200 = 'error 200';
    int errorCode200 = 200;

    List<Map<String, dynamic>> errors = [{'code': errorCode100, 'error' : error100}, 
    {'code': errorCode200, 'error' : error200}];

    final error = Error(errorCode100, error100);
    error.addError(errorCode200, error200);
    expect(error.getError(), error100);
    expect(error.getErrorCode(), errorCode100);
    expect(error.isAnError(error), true);
    expect(error.isAnError('error'), false);
    expect(error.getAllErrors(), errors);
  });
}
