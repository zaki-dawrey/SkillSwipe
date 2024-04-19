// // ignore_for_file: library_private_types_in_public_api, avoid_print, no_leading_underscores_for_local_identifiers

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:skillswap/state/auth/providers/auth_state_provider.dart';
// import 'package:skillswap/utilities/dialogs/logout_dialog.dart';
// import 'package:swipeable_card_stack/swipeable_card_stack.dart';

// class SwipeCard extends ConsumerStatefulWidget {
//   const SwipeCard({super.key});

//   @override
//   // _SwipeCardState createState() => _SwipeCardState();
//   ConsumerState<ConsumerStatefulWidget> createState() => _SwipeCardState();
// }

// class _SwipeCardState extends ConsumerState<SwipeCard> {
//   int counter = 4;

//   @override
//   Widget build(BuildContext context) {
//     //create a CardController
//     SwipeableCardSectionController _cardController =
//         SwipeableCardSectionController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "SkillSwap",
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.logout_outlined,
//             ),
//             color: Colors.white,
//             iconSize: 25,
//             tooltip: 'Logout',
//             onPressed: () async {
//               bool logoutConfirmed = await showLogOutDialog(context);

//               if (logoutConfirmed) {
//                 ref.read(authStateProvider.notifier).logOut();
//               }
//             },
//           )
//         ],
//         backgroundColor: const Color(0xFF012333),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SwipeableCardsSection(
//             cardController: _cardController,
//             context: context,
//             //add the first 3 cards
//             items: const [
//               CardView(text: "First card"),
//               CardView(text: "Second card"),
//               CardView(text: "Third card"),
//             ],
//             onCardSwiped: (dir, index, widget) {
//               //Add the next card
//               if (counter <= 20) {
//                 _cardController.addItem(CardView(text: "Card $counter"));
//                 counter++;
//               }

//               if (dir == Direction.left) {
//                 print('onDisliked ${(widget as CardView).text} $index');
//               } else if (dir == Direction.right) {
//                 print('onLiked ${(widget as CardView).text} $index');
//               }
//             },
//             enableSwipeUp: false,
//             enableSwipeDown: false,
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FloatingActionButton(
//                   child: const Icon(Icons.chevron_left),
//                   onPressed: () => _cardController.triggerSwipeLeft(),
//                 ),
//                 FloatingActionButton(
//                   child: const Icon(Icons.chevron_right),
//                   onPressed: () => _cardController.triggerSwipeRight(),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class CardView extends StatelessWidget {
//   final String username;
//   final String skill;
//   final String interestedSkill;
//   const CardView({
//     super.key,
//     required this.username,
//     required this.skill,
//     required this.interestedSkill,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SwipeableWidget( // Main card widget from the package
//       key: ObjectKey(username), // Consider a unique key (e.g., userId)
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Username: $username", style: const TextStyle(fontWeight: FontWeight.bold)), 
//               Text("Skill: $skill"), 
//               Text("Interested Skill: $interestedSkill"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
