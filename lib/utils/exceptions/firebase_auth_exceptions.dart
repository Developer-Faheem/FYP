class SFirebaseAuthException implements Exception {
  final String code;

  SFirebaseAuthException(this.code);

  String get meassage {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'The requested authentication operation is not allowed.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'There is no user corresponding to the given email address.';
      case 'wrong-password':
        return 'The password is incorrect for the given email address.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'missing-verification-code':
        return 'The verification code is missing.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'quota-exceeded':
        return 'The request quota for this operation has been exceeded.';
      case 'provider-already-linked':
        return 'The provider is already linked to the user.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'The credential is already in use by another account.';
      case 'user-mismatch':
        return 'The provided credential does not match the existing user.';
      default:
        return 'An unknown error occurred.';
    }
  }
}
