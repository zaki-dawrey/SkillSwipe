import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillswap/state/auth/providers/auth_state_provider.dart';
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
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            color: Colors.white,
            iconSize: 28,
            tooltip: 'Logout',
            onPressed: () async {
              bool logoutConfirmed = await showLogOutDialog(context);

              if (logoutConfirmed) {
                ref.read(authStateProvider.notifier).logOut();
              }
            },
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 550,
              decoration: ShapeDecoration(
                color: const Color(0xFFEBF5ED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 330),
                    Text(
                      "Zaki Dawrey",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Skills: Coding, Video Editing",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Interests: Video Editing",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 25,
              left: 40,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
            const Positioned(
              bottom: 8,
              left: 140,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 50,
                ),
              ),
            ),
            const Positioned(
              bottom: 25,
              right: 40,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
