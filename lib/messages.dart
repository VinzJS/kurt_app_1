import 'package:flutter/material.dart';
import 'chatscreen.dart';

class MessageScreen extends StatelessWidget {
  final List<MessageItem> messageItems = [
    MessageItem(
      userName: 'Fiona Shrek',
      userProfileImage: 'lib/Fiona.jpg',
      message: 'We have 2 bedrooms available!',
      time: DateTime.now(),
    ),
    MessageItem(
      userName: 'Raziephica',
      userProfileImage: 'lib/Raz.jpg',
      message: 'Yes sir, Avail pa',
      time: DateTime.now(),
    ),
    MessageItem(
      userName: 'Efren Bata San',
      userProfileImage: 'lib/efren.jpg',
      message: 'Lapit lang sa Knytz',
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messageItems.length,
        itemBuilder: (context, index) {
          final messageItem = messageItems[index];
          return buildMessageItem(context, messageItem);
        },
      ),
    );
  }

  Widget buildMessageItem(BuildContext context, MessageItem messageItem) {
    return ListTile(
      title: Text(messageItem.userName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messageItem.message),
          Text(
            '${messageItem.time.hour}:${messageItem.time.minute}',
          ),
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(messageItem.userProfileImage),
      ),
      onTap: () {
        // Navigate to chat screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(userName: messageItem.userName)),
        );
      },
    );
  }
}

class MessageItem {
  final String userName;
  final String userProfileImage;
  final String message;
  final DateTime time;

  MessageItem({
    required this.userName,
    required this.userProfileImage,
    required this.message,
    required this.time,
  });
}
