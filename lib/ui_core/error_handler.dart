import '../constant/errors.dart' as errors;

class ErrorHandler {
  static String selectMessage(String err) {
    String result = err;

    switch (err) {
      case errors.getUserErr:
        break;

      case errors.createUserErr:
        break;

      case errors.deleteUserErr:
        break;

      default:
        result = '予期せぬエラーが発生しました。時間をおいて再度お試しください。';
        break;
    }

    return result;
  }
}
