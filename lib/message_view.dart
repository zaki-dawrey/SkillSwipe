import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message",
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black,
      ),
    );
  }
}