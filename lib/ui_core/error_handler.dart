import '../constant/errors.dart' as errors;

String selectMessage(String err) {
  var result = err;

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
