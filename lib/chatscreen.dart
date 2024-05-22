import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  ChatScreen({required this.userName});

  // Sample list of messages for demonstration
  final List<Message> messages = [
    Message(sender: 'Fiona', text: 'Yes, still available miss'),
    Message(sender: 'Me', text: 'How many slots left?'),
    Message(sender: 'Fiona', text: '2 pa maam'),
    Message(sender: 'Me', text: 'ge ah!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(
                  sender: message.sender,
                  text: message.text,
                  isMe: message.sender == userName,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                    // Implement send message functionality
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Message model
class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

// MessageBubble widget to display each message
class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(8.0),
            elevation: 5.0,
            color: isMe ? Colors.blue : Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
