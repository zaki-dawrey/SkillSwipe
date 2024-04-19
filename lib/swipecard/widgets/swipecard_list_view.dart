import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/main.dart';
import 'package:skillswap/swipecard/providers/swipecard_notifier.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeCardView extends ConsumerWidget {
  const SwipeCardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = supabase.auth.currentUser?.id;
    final swipecardNotifier = ref.watch(swipecardNotifierProvider);
    return swipecardNotifier.when(
      error: (err, _) => const Center(
        child: Text(
          'Error fetching Card Data',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 600,
            child: CardSwiper(
              cardsCount: 2,

              cardBuilder: (context, index, x, y) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 400,
                    height: 300,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEBF5ED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 350),
                          Text(
                            data[index].username,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data[index].skillName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data[index].interestedSkillName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },

              allowedSwipeDirection:
                  const AllowedSwipeDirection.only(right: true, left: true),

              // numberOfCardsDisplayed: 4,

              // isLoop: false,

              // backCardOffset: Offset(50,50),

              onSwipe: (prevoius, current, direction) async {
                // currentindex = current!;
                if (direction == CardSwiperDirection.right) {
                  print('Current Index: $current');
                  print('User ID: ${data[index].userId}');

                  await supabase.rpc('like_swipe', params: {
                    'current_user_id': user,
                    'other_user_id': data[index].userId,
                    'is_like': true,
                  });
                } else if (direction == CardSwiperDirection.left) {}
                return true;
              },
            ),
          );
        },
      ),
    );
  }
}
