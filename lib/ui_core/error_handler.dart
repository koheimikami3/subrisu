import '../constant/errors.dart' as errors;

class ErrorHandler {
  static String selectMessage(String err) {
    String result = err;

    switch (err) {
      case errors.signInAnonymouslyErr:
        break;

      case errors.getUserErr:
        break;

      case errors.createUserErr:
        break;

      case errors.deleteUserErr:
        break;

      default:
        result = errors.unexpectedErr;
        break;
    }

    return result;
  }
}
