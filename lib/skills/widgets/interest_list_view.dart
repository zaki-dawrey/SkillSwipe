import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/skills/providers/skills_notifier.dart';
import 'package:skillswap/users/providers/users_notifier.dart';

class InterestsListView extends ConsumerWidget {
  const InterestsListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsNotifier = ref.watch(skillsNotifierProvider);
    return Container(
      child: skillsNotifier.when(
        error: (err, _) => const Center(
          child: Text(
            'Error fetching Skills',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          final userData = ref.read(usersNotifierProvider).value ?? [];
          final userSkillSet =
              userData.map((user) => user.interestedId).toSet();

          final filteredData =
              data.where((skills) => userSkillSet.contains(skills.id)).toList();

          return ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      filteredData[index].name,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
