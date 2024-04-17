import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore",
          style: TextStyle(
            color: Colors.white,
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
          Container(
              width: size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(18),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              )),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
