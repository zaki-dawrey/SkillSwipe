import 'package:flutter/material.dart';
import 'package:skillswap/in_message.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Message",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF012333),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InMessage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Samee Shaikh",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "You have been accepted!",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InMessage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Prasad Ghadge",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "You have been accepted!",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
