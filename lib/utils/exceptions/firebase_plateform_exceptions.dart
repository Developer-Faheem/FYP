class SPlatformException implements Exception {
  final String code;

  SPlatformException(this.code);

  String get message {
    switch (code) {
      case 'invalid-login-credentials':
        return 'Invalid login credentials.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided.';
      case 'invalid-password':
        return 'Invalid password.';
      case 'invalid-phone-number':
        return 'Invalid phone number.';
      case 'operation-not-allowed':
        return 'The requested operation is not allowed.';
      case 'session-cookie-expired':
        return 'The session cookie has expired.';
      case 'uid-already-exists':
        return 'The UID already exists.';
      case 'sign-in-failed':
        return 'Sign-in failed.';
      case 'network-request-failed':
        return 'Network request failed.';
      case 'internal-error':
        return 'Internal error.';
      case 'invalid-verification-code':
        return 'Invalid verification code.';
      default:
        return 'An unknown platform error occurred.';
    }
  }
}
