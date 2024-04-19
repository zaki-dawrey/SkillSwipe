import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int currentindex = 0;

  Color defaultcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 650,
      child: CardSwiper(
        cardsCount: 8,

        cardBuilder: (context, index, x, y) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 400,
              height: 560,
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
                    SizedBox(height: 350),
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
          );
        },

        allowedSwipeDirection:
            const AllowedSwipeDirection.only(right: true, left: true),

        // numberOfCardsDisplayed: 4,

        // isLoop: false,

        // backCardOffset: Offset(50,50),

        onSwipe: (prevoius, current, direction) {
          currentindex = current!;
          if (direction == CardSwiperDirection.right) {
          } else if (direction == CardSwiperDirection.left) {}
          return true;
        },
      ),
    );
  }
}
