import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo and Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/chae.jpg'), // Replace with profile photo
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chaeyoung', // Replace with user's name
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Email: chaeyoung04@gmail.com', // Replace with user's email
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      _buildChatButton(), // Move chat button here
                    ],
                  ),
                ],
              ),
            ),
            // Bio and Reviews
            _buildSectionTitle('Bio'),
            _buildBio(), // Custom function to build bio section
            SizedBox(height: 8.0), // Add spacing between bio and reviews
            Divider(), // Divider to separate sections
            // Reviews
            _buildSectionTitle('Reviews'),
            _buildReviews(), // Custom function to build reviews section
            SizedBox(height: 16.0),
            Divider(), // Divider to separate sections
            // Posted Lists
            _buildSectionTitle('Posted Lists'),
            _buildPostedLists(), // Custom function to build posted lists
          ],
        ),
      ),
    );
  }

  // Custom function to build section title with styling
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Custom function to build posted lists section
  Widget _buildPostedLists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomListing(
          image: 'lib/download.jpg',
          description: 'Cozy Room with a View',
          price: '\$1000/month',
          availability: 'Available from: 01/01/2024',
          additionalInfo:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed nisi quis lectus vehicula porta.',
          userName: 'John Doe', // Replace with the user's name
           // Replace with the user's profile image
        ),
        RoomListing(
          image: 'lib/download.jpg',
          description: 'Cozy Room with a View',
          price: '\$1000/month',
          availability: 'Available from: 01/01/2024',
          additionalInfo:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed nisi quis lectus vehicula porta.',
          userName: 'John Doe', // Replace with the user's name
           // Replace with the user's profile image
        ),
        RoomListing(
          image: 'lib/download.jpg',
          description: 'Cozy Room with a View',
          price: '\$1000/month',
          availability: 'Available from: 01/01/2024',
          additionalInfo:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed nisi quis lectus vehicula porta.',
          userName: 'John Doe', // Replace with the user's name
           // Replace with the user's profile image
        ),
      ],
    );
  }

  // Custom function to build bio section
  Widget _buildBio() {
    return Text(
      'Help us, O LORD our God, for we trust in you alone.',
      style: TextStyle(fontSize: 14.0), // Decrease font size for bio
    );
  }

  // Custom function to build chat button
  Widget _buildChatButton() {
    return ElevatedButton(
      onPressed: () {
        // Add functionality to initiate chat
      },
      child: Text('Chat'),
    );
  }

  // Custom function to build reviews section
  Widget _buildReviews() {
    return Text(
      'No reviews yet', // Placeholder for no reviews
    );
  }
}

class RoomListing extends StatelessWidget {
  final String image;
  final String description;
  final String price;
  final String availability;
  final String additionalInfo;
  final String userName;

  RoomListing({
    required this.image,
    required this.description,
    required this.price,
    required this.availability,
    required this.additionalInfo,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(image),
        title: Text(description),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price),
            Text(availability),
            Text(additionalInfo),
           
          ],
        ),
      ),
    );
  }
}
