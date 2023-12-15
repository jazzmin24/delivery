class ResponseModel {
  bool _isSuccess;
  String _message;
  ResponseModel(this._isSuccess, this._message);
  //private var can not be wrapped in curly braces
  String get message => _message;
  bool get isSuccess => _isSuccess;
}
