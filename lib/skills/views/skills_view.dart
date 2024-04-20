// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/skills/skills.dart';
import 'package:skillswap/skills/widgets/interest_list_view.dart';

class SkillsView extends ConsumerStatefulWidget {
  const SkillsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkillsViewState();
}

class _SkillsViewState extends ConsumerState<SkillsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(skillsNotifierProvider);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Skill',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: SkillsListView(),
                ),
                Text(
                  'Your Interest',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: InterestsListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
