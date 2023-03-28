

class AppException implements Exception{

  final _message;
  final profit;

  AppException(this._message, this.profit);

  String toString(){
    return "$profit$_message";
  }

}

// when we will not receive response within 10 seconds then we get this exception
class FetchDataException extends AppException{
   FetchDataException([String? message]) : super(message, "Error during communication");
}


//when URl or Route does not exist
class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, "Invalid Request");
}


//check validated user
class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]) : super(message, "Unauthorised Request");
}


//Invalid Input
class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}