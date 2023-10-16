library custom_error;

class CustomError {
  
  String? _error;
  int? _code;

  List<Map<String, dynamic>> errors = [];

  CustomError();

  void addError(int errorCode, String errorMsg){
    setError(errorCode, errorMsg);
    errors.add({'code': errorCode, 'error' : errorMsg});
  }

  void setError(int errorCode, String errorMsg){
    _setErrorMsg(errorMsg);
    _setErrorCode(errorCode);
  }

  void _setErrorMsg(String errorMsg){
    _error = errorMsg;
  }

  void _setErrorCode(int errorCode){
    _code = errorCode;
  }

  String getError(){
    return _error!;
  }

  int getErrorCode(){
    return _code!;
  }

  bool hasAnError(){
    return (_error != null && _code != null) ? true : false;
  }

  List<Map<String, dynamic>> getAllErrors(){
    return errors;
  }

  bool isAnError(){
    //return (val is CustomError) ? true : false;
    return hasAnError();
  }
}