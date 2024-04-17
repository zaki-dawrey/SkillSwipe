import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skillswap/skills/skills.dart';

part 'skills_notifier.g.dart';

@riverpod
class SkillsNotifier extends _$SkillsNotifier {
  @override
  Future<List<Skills>> build() async {
    return ref.read(skillsRepositoryProvider).getSkills();
  }
}
