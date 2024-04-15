import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/state/auth/providers/auth_state_provider.dart';
import 'package:skillswap/state/user_info/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
