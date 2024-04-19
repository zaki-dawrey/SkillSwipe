import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/state/auth/providers/auth_state_provider.dart';
import 'package:skillswap/swipecard/widgets/card_view.dart';
import 'package:skillswap/swipecard/widgets/swipecard_list_view.dart';
import 'package:skillswap/utilities/dialogs/logout_dialog.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SkillSwap",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            color: Colors.white,
            iconSize: 25,
            tooltip: 'Logout',
            onPressed: () async {
              bool logoutConfirmed = await showLogOutDialog(context);

              if (logoutConfirmed) {
                ref.read(authStateProvider.notifier).logOut();
              }
            },
          )
        ],
        backgroundColor: const Color(0xFF012333),
      ),
      body: const SwipeCardView(),
    );
  }
}
