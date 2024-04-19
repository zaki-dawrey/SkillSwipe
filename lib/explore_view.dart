import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/skills/providers/skills_notifier.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsNotifier = ref.watch(skillsNotifierProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xFF012333),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0), // Adjust as needed
                child: TextField(
                  // Integrate TextField here
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove default TextField border
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Recommended For You",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
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
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 12, left: 12, right: 12),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              data[index].name,
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
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
