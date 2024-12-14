library custom_error;

/// A class for managing custom errors.
class CustomError {

  // error message
  String? _error;

  // error code
  int? _code;

  // show error dialog
  bool? showDialogOnError = false;

  // list of errors
  List<Map<String, dynamic>> errors = [];

  /// Default constructor for the CustomError class.
  CustomError({this.showDialogOnError});

  /// Add a new error with the specified [errorCode] and [errorMsg].
  void addError(int errorCode, String errorMsg) {
    setError(errorCode, errorMsg);
    errors.add({'code': errorCode, 'error': errorMsg});
  }

  /// Set the error message to [errorMsg] and error code to [errorCode].
  void setError(int errorCode, String errorMsg) {
    _setErrorMsg(errorMsg);
    _setErrorCode(errorCode);
  }

  /// Set the error message to [errorMsg].
  void _setErrorMsg(String errorMsg) {
    _error = errorMsg;
  }

  /// Set the error code to [errorCode].
  void _setErrorCode(int errorCode) {
    _code = errorCode;
  }

  /// Get the error message.
  String getError() {
    return _error!;
  }

  /// Get the error code.
  int getErrorCode() {
    return _code!;
  }

  /// Check if an error exists. Returns `true` if an error exists; otherwise, `false`.
  bool hasAnError() {
    return (_error != null && _code != null) ? true : false;
  }

  // get all errors
  List<Map<String, dynamic>> getAllErrors() {
    return errors;
  }

  /// Check if an error exists. Returns `true` if an error exists; otherwise, `false`.
  bool isAnError() {
    //return (val is CustomError) ? true : false;
    return hasAnError();
  }

  // get last error
  Map<String, dynamic>? getLatestError(){
    return errors.isNotEmpty ? errors.last : null;
  }

  // get error by code
  List<Map<String, dynamic>> findErrorByCode(int targetCode){
    return errors.where((error) => error['code'] == targetCode).toList();
  }
}
