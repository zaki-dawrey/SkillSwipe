// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:skillswap/main.dart';
// import 'package:skillswap/swipecard/providers/swipecard_notifier.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// class SwipeCardView extends ConsumerWidget {
//   const SwipeCardView({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = supabase.auth.currentUser?.id;
//     final swipecardNotifier = ref.watch(swipecardNotifierProvider);
//     return swipecardNotifier.when(
//         error: (err, _) => const Center(
//               child: Text(
//                 'Error fetching Card Data',
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//         loading: () => const Center(
//               child: CircularProgressIndicator(),
//             ),
//         data: (data) {
//           if (data.isEmpty) {
//             return const Center(child: Text('No cards available'));
//           } else {
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 600,
//                   child: CardSwiper(
//                       cardsCount: data.length,
//                       cardBuilder: (context, index, x, y) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Container(
//                             width: 400,
//                             height: 300,
//                             decoration: ShapeDecoration(
//                               color: const Color(0xFFEBF5ED),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(12),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   const SizedBox(height: 350),
//                                   Text(
//                                     data[index].username,
//                                     style: GoogleFonts.inter(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Text(
//                                     data[index].skillName,
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.inter(
//                                         fontSize: 15,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Text(
//                                     data[index].interestedSkillName,
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.inter(
//                                         fontSize: 15,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       allowedSwipeDirection: const AllowedSwipeDirection.only(
//                           right: true, left: true),
//                       isLoop: false,
//                       onSwipe: (prevoius, current, direction) async {
//                         // currentindex = current!;
//                         if (direction == CardSwiperDirection.right) {
//                           final swipeCard = data[current!];
//                           await supabase.rpc('like_swipe', params: {
//                             'current_user_id': user,
//                             'other_user_id': swipeCard.userId,
//                             'is_like': true,
//                           });
//                           // data.removeAt(current!);
//                           // ref
//                           //     .read(swipecardNotifierProvider.notifier)
//                           //     .updateList(data);
//                         } else if (direction == CardSwiperDirection.left) {
//                           final swipeCard = data[current!];
//                           await supabase.rpc('like_swipe', params: {
//                             'current_user_id': user,
//                             'other_user_id': swipeCard.userId,
//                             'is_like': false,
//                           });
//                           // data.removeAt(current!);
//                           // ref
//                           //     .read(swipecardNotifierProvider.notifier)
//                           //     .updateList(data);
//                         }
//                         return true;
//                       }),
//                 ),
//               ],
//             );
//           }
//         });
//   }
// }

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/main.dart';
import 'package:skillswap/swipecard/models/swipecard.dart';
import 'package:skillswap/swipecard/providers/swipecard_notifier.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeCardView extends ConsumerWidget {
  const SwipeCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = supabase.auth.currentUser?.id;
    final swipecardNotifier = ref.watch(swipecardNotifierProvider);

    return swipecardNotifier.when(
      error: (err, _) => _buildError(),
      loading: () => _buildLoading(),
      data: (data) => _buildData(context, ref, data, user),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text(
        'Error fetching Card Data',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildData(
    BuildContext context,
    WidgetRef ref,
    List<Swipecard> data,
    String? user,
  ) {
    if (data.isEmpty) {
      return const Center(
        child: Text(
          'No cards available',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: 600,
            child: CardSwiper(
              cardsCount: data.length,
              cardBuilder: (context, index, x, y) {
                final cardData = data[index];
                return _buildCard(context, cardData);
              },
              allowedSwipeDirection: const AllowedSwipeDirection.only(
                right: true,
                left: true,
              ),
              isLoop: false,
              onSwipe: (previous, current, direction) async {
                // Ensure the previous and current indexes are valid
                if (current != null && current < data.length) {
                  final swipeCard = data[previous];
                  print(previous);
                  print(swipeCard.userId);
                  print(swipeCard.username);

                  if (direction == CardSwiperDirection.right) {
                    await supabase.rpc('like_swipe', params: {
                      'current_user_id': user,
                      'other_user_id': swipeCard.userId,
                      'is_like': true,
                    });
                  } else if (direction == CardSwiperDirection.left) {
                    await supabase.rpc('like_swipe', params: {
                      'current_user_id': user,
                      'other_user_id': swipeCard.userId,
                      'is_like': false,
                    });
                  }
                }
                return true;
              },
            ),
          ),
        ],
      );
    }
  }

//   Widget _buildCard(BuildContext context, Swipecard cardData) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 400,
//         height: 300,
//         decoration: BoxDecoration(
//           color: const Color(0xFFEBF5ED),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const SizedBox(height: 350),
//               Text(
//                 cardData.username,
//                 style: GoogleFonts.inter(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 cardData.skillName,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 cardData.interestedSkillName,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  Widget _buildCard(BuildContext context, Swipecard cardData) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade200, // Start color
              Colors.teal.shade900, // End color
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20), // Adjust spacing as needed
              Text(
                'Username: ${cardData.username}',
                style: GoogleFonts.inter(
                  fontSize: 18, // Make it a bit bigger
                  color: Colors.white,
                  fontWeight: FontWeight.w500, // Slightly bolder
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Skill: ${cardData.skillName}',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Interested Skill: ${cardData.interestedSkillName}',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
