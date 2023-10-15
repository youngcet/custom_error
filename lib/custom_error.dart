library custom_error;

class CustomError {
  
  String error;
  int code;

  List<Map<String, dynamic>> errors = [];

  CustomError(this.code, this.error){
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
    return (val is CustomError) ? true : false;
  }
}
