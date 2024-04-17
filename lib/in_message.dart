import 'package:flutter/material.dart';

class InMessage extends StatelessWidget {
  const InMessage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0), // Adjust as needed
            child: TextField(
              // Integrate TextField here
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default TextField border
                hintText: 'Message',
              ),
            ),
            
          ),
          
        ),
        
      ),
    );
  }
}
