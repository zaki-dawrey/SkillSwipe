import 'package:skillswap/main.dart';
import 'package:skillswap/state/auth/models/auth_result.dart';
import 'package:skillswap/state/user_info/typedefs/user_id.dart';

class Authenticator {
  const Authenticator();
  UserId? get userId => supabase.auth.currentSession?.user.id;

  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      supabase.auth.currentUser!.userMetadata?['full_name'] ?? '';
  String? get email => supabase.auth.currentUser?.email;

  Future<void> logOut() async {
    await supabase.auth.signOut();
  }

  Future<AuthResult> loginWithEmailPassword(
      String email, String password) async {
    try {
      final signInAccount = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if (signInAccount == null) {
        return AuthResult.aborted;
      } else {
        return AuthResult.success;
      }
    } catch (error) {
      return AuthResult.failure;
    }
  }
}
