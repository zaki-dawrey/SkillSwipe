import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:skillswap/users/models/users.dart';

part 'users_repository.g.dart';

@riverpod
UsersRepository usersRepository(UsersRepositoryRef _) => UsersRepository();

class UsersRepository {
  final _client = Supabase.instance.client;

  Future<List<Users>> getUsers() => _client
      .from('user')
      .select('id, username, desc, skill_id, interested_id')
      .then((data) => data.map((json) => Users.fromJson(json)).toList());


  Future<void> addUser({
    required String username,
    required String desc,
    required int skillId,
    required int interestedSkillId,
  }) =>
      _client.from('user').insert({
        'username': username,
        'desc': desc,
        'skill_id': skillId,
        'interested_id': interestedSkillId,
      });
}
