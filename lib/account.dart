import 'package:flutter/material.dart';
import 'profile.dart'; // Import the profile.dart file

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile section
          GestureDetector(
            onTap: () {
              // Navigate to profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: ListTile(
              title: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/chae.jpg'), // Add your image path here
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Chaeyoung', // Add your user's name here
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
          // Edit Profile section with modal dialog
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.notifications),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Edit Profile'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Phone Number'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform profile editing logic
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          // Change Password section with modal dialog
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.lock_open),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Change Password'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Current Password'),
                          obscureText: true,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'New Password'),
                          obscureText: true,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Confirm New Password'),
                          obscureText: true,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform password change logic
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Change'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          // Posted list section
          ListTile(
            title: Text('Posted Lists'),
            leading: Icon(Icons.post_add),
            onTap: () {
              // Navigate to posted list page
            },
          ),
        ],
      ),
    );
  }
}
