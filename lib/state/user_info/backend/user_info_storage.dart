import 'package:flutter/foundation.dart' show immutable;
import 'package:skillswap/main.dart';
import 'package:skillswap/state/user_info/typedefs/user_id.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      // Check user info
      final userInfo =
          await supabase.from('users').select().eq('userId', userId).limit(1);

      if (userInfo.isNotEmpty) {
        await supabase.from('users').update({
          'displayName': displayName,
          'email': email ?? '',
        }).eq('userId', userId);
        return true;
      }

      // We don't have the user; creating a new user
      final payload = {
        'userId': userId,
        'displayName': displayName,
        'email': email,
      };

      await supabase.from('users').upsert([payload]);

      return true;
    } catch (e) {
      return false;
    }
  }
}
