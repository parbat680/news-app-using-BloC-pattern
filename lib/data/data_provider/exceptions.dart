class CustomException {
  String error, message;

  CustomException({required this.error, required this.message});

  @override
  String toString() => "$message";
}

class FormatException extends CustomException {
  String error;
  FormatException({required this.error})
      : super(error: error, message: "Something went wrong");
}

class UnauthorisedException extends CustomException {
  String error;
  UnauthorisedException({required this.error})
      : super(error: error, message: "Unauthorised Request");
}

class BadRequestException extends CustomException {
  String error;
  BadRequestException({required this.error})
      : super(error: error, message: "Server down");
}

getException(int status) {
  switch (status) {
    case 401:
      throw UnauthorisedException(error: "Unauthorised");

    case 500:
    default:
      throw BadRequestException(error: "Bad Request");
  }
}
