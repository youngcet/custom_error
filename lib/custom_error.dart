library custom_error;

class Error {
  
  String error;
  int code;

  List<Map<String, dynamic>> errors = [];

  Error(this.code, this.error){
    _setError(error);
    _setErrorCode(code);

    errors.add({'code': code, 'error' : error});
  }

  void addError(int errorCode, String errorMsg){
    errors.add({'code': errorCode, 'error' : errorMsg});
  }

  void _setError(String errorMsg){
    error = errorMsg;
  }

  void _setErrorCode(int errorCode){
    code = errorCode;
  }

  String getError(){
    return error;
  }

  int getErrorCode(){
    return code;
  }

  List<Map<String, dynamic>> getAllErrors(){
    return errors;
  }

  bool isAnError(dynamic val){
    return (val is Error) ? true : false;
  }
}
