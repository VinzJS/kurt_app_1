import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  ChatScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Center(
        child: Text('Chat screen for $userName'),
      ),
    );
  }
}
