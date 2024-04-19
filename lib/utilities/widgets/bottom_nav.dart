import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skillswap/explore_view.dart';
import 'package:skillswap/home_view.dart';
import 'package:skillswap/message_view.dart';
import 'package:skillswap/views/profile_view.dart';
import 'package:skillswap/views/swipe_card.dart';

class BottomnavBar extends StatefulWidget {
  const BottomnavBar({super.key});

  @override
  State<BottomnavBar> createState() => _BottomnavBarState();
}

class _BottomnavBarState extends State<BottomnavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red[900],
      body: _buildSelectedScreen(),
      bottomNavigationBar: Container(
        color: const Color(0xFF012333),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10,
          ),
          child: GNav(
            activeColor: Colors.black,
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            gap: 8,
            padding: const EdgeInsets.all(10),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.electric_bolt_sharp,
                //text: 'Home',
              ),
              GButton(
                icon: Icons.explore,
                iconSize: 32,
              ),
              GButton(
                icon: Icons.messenger_rounded,
              ),
              GButton(
                icon: Icons.person_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const ExploreView();
      case 2:
        return const MessageView();
      case 3:
        return const ProfileView();
      default:
        return const SizedBox.shrink();
    }
  }
}
