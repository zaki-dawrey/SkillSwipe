import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:skillswap/skills/models/skills.dart';

part 'skills_repository.g.dart';

@riverpod
SkillsRepository skillsRepository(SkillsRepositoryRef _) => SkillsRepository();

class SkillsRepository {
  final _client = Supabase.instance.client;

  Future<List<Skills>> getSkills() => _client
      .from('skill')
      .select('id, name, photo_id, created_at')
      .order('created_at', ascending: false)
      .then((data) => data.map((json) => Skills.fromJson(json)).toList());
}
