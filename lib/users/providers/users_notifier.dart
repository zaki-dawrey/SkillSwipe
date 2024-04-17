import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skillswap/users/users.dart';

part 'users_notifier.g.dart';

@riverpod
class UsersNotifier extends _$UsersNotifier {
  @override
  Future<List<Users>> build() async {
    return ref.read(usersRepositoryProvider).getUsers();
  }
}
