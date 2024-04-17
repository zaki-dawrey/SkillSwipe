import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/main.dart';
import 'package:skillswap/skills/skills.dart';
import 'package:skillswap/skills/views/skills_view.dart';
import 'package:skillswap/users/widgets/user_list_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = supabase.from('user').stream(primaryKey: ['id']);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            color: Colors.white,
            iconSize: 25,
            tooltip: 'notification',
            onPressed: () {},
          )
        ],
        backgroundColor: const Color(0xFF012333),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Color(0xFF012333),
            ),
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: data,
              builder: (context, snapshot) {
                return const UserListView();
              },
            ),
          ),

          // const Padding(
          //   padding: EdgeInsets.all(12.0),
          //   child: Text(
          //     "Skills",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          // Container(
          //   width: size.width,
          //   height: 220,
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             width: 160,
          //             height: 180,
          //             decoration: BoxDecoration(
          //               color: const Color(0xFFEBF5ED),
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //             child: StreamBuilder<List<Map<String, dynamic>>>(
          //               stream: data,
          //               builder: (context, snapshot) {
          //                 return const SkillsListView();
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          // ),
          // ),
          const SkillsView(),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
