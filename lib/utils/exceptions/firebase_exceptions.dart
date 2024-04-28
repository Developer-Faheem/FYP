class SFirebaseException implements Exception {
  final String code;

  SFirebaseException(this.code);

  String get message {
    switch (code) {
      // Common errors
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'unknown':
        return 'An unknown error occurred.';
      case 'invalid-argument':
        return 'An invalid argument was provided.';
      case 'deadline-exceeded':
        return 'The operation deadline has expired.';
      case 'not-found':
        return 'The requested resource was not found.';
      case 'already-exists':
        return 'The resource already exists.';
      case 'permission-denied':
        return 'The operation was denied due to insufficient permissions.';
      case 'unauthenticated':
        return 'The user is not authenticated.';
      case 'resource-exhausted':
        return 'The resource has been exhausted.';
      case 'failed-precondition':
        return 'The operation failed to meet a precondition.';
      case 'aborted':
        return 'The operation was aborted.';
      case 'out-of-range':
        return 'The operation was attempted beyond the valid range.';
      case 'unimplemented':
        return 'The operation is not implemented.';
      case 'internal':
        return 'An internal error occurred.';
      case 'unavailable':
        return 'The service is currently unavailable.';
      case 'data-loss':
        return 'Data loss occurred.';

      // Authentication errors
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password is not strong enough.';
      case 'email-already-in-use':
        return 'The provided email is already in use by an existing user.';
      case 'wrong-password':
        return 'The provided password is incorrect.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'operation-not-allowed':
        return 'The requested authentication operation is not allowed.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same identifier but different credentials.';
      case 'invalid-credential':
        return 'The provided credential is invalid.';
      case 'credential-already-in-use':
        return 'The provided credential is already in use by an existing user.';
      case 'user-not-found':
        return 'The requested user was not found.';
      case 'quota-exceeded':
        return 'The quota for this operation has been exceeded.';
      case 'session-expired':
        return 'The session has expired.';
      case 'maximum-user-count-exceeded':
        return 'The maximum number of users has been reached.';

      // Database errors
      case 'disconnected':
        return 'The client is disconnected from the database.';
      case 'unhandled-exception':
        return 'An unhandled exception occurred in the database.';
      case 'invalid-path':
        return 'The provided database path is invalid.';
      case 'value-too-large':
        return 'The data to be written is too large.';
      case 'permission-unspecified':
        return 'A specific permission is required for this operation but none was specified.';
      case 'write-blocked':
        return 'Writes to the database are temporarily blocked.';

      // Storage errors
      case 'canceled':
        return 'The storage operation was cancelled.';
      case 'bucket-not-found':
        return 'The specified storage bucket does not exist.';
      case 'object-not-found':
        return 'The specified storage object does not exist.';
      case 'project-not-found':
        return 'The project associated with the storage bucket was not found.';
      case 'unauthorized-deletion':
        return 'The user is not authorized to delete the object.';
      case 'unauthorized-download':
        return 'The user is not authorized to download the object.';
      case 'unauthorized-upload':
        return 'The user is not authorized to upload the object.';
      case 'object-too-large':
        return 'The uploaded object exceeds the maximum allowed size.';
      case 'cancelled-by-server':
        return 'The storage operation was cancelled by the server.';
      case 'file-not-uploaded':
        return 'The file was not uploaded successfully.';
      case 'invalid-checksum':
        return 'The uploaded file checksum does not match the expected value.';
      case 'needs-permission':
        return 'The user needs specific permissions to access the object.';
      default:
        return 'An unknown Firebase error occurred (code: $code).';
    }
  }
}
