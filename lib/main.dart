import 'package:flutter/material.dart';
import 'filter.dart'; // Import the filter.dart file
import 'account.dart'; // Import the account.dart file
import 'messages.dart'; // Import the messages.dart file
import 'savelistings.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class RoomListing {
  final String image;
  final String description;
  final String price;
  final String availability;
  final String additionalInfo;
  final String userName; // User's name
  final String userProfileImage; // User's profile image

  RoomListing({
    required this.image,
    required this.description,
    required this.price,
    required this.availability,
    required this.additionalInfo,
    required this.userName,
    required this.userProfileImage,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(233, 1, 181, 191), // Set background color to purple
      ),
    );
  }
}

class RoomListingsScreen extends StatelessWidget {
  final List<RoomListing> roomListings = [
    RoomListing(
      image: 'lib/Dormph.jpg',
      description: 'Gate 5 Narnia Dormitory',
      price: 'P2500/month',
      availability: 'Available from: 01/01/2024',
      additionalInfo: 'In the heart of the city, this cozy dormitory offers convenient living for students, complete with modern amenities and a vibrant community atmosphere. 🏙️🛏️ #CityLiving #StudentLife',
      userName: 'Fiona Shrek', // Replace with the user's name
      userProfileImage: 'lib/Fiona.jpg', // Replace with the user's profile image
    ),
    RoomListing(
      image: 'lib/bed.jpg',
      description: 'Banago Room For Rent',
      price: '\$1000/month',
      availability: 'Available from: 01/01/2024',
      additionalInfo: 'Spacious room for rent in a prime location! Enjoy comfort and convenience in this well-appointed space, perfect for students or professionals. 🏠💼 #RoomForRent #CityLiving',
      userName: 'Efren Bata San', // Replace with the user's name
      userProfileImage: 'lib/efren.jpg', // Replace with the user's profile image
    ),
    RoomListing(
      image: 'lib/house.jpg',
      description: 'Balay likod Savemore',
      price: '\$1000/month',
      availability: 'Available from: 01/01/2024',
      additionalInfo: 'Lapit kaayo',
      userName: 'Raziephica', // Replace with the user's name
      userProfileImage: 'lib/Raz.jpg', // Replace with the user's profile image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spare Room Bacolod',
          textAlign: TextAlign.center, // This ensures the text is centered within the app bar
        ),
        centerTitle: true, // Center the title horizontally
      ),
   drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      GestureDetector(
        onTap: () {
          // Perform action when the drawer header is tapped
        },
        child: UserAccountsDrawerHeader(
          accountName: Text('Chaeyoung'), // Replace with the user's name
          accountEmail: Text('Live Love La Salle'), // Replace with the user's email
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('lib/chae.jpg'), // Replace with the user's profile image
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(166, 0, 211, 243),
          ),
        ),
      ),
      ListTile(
        title: Text('Home'),
        onTap: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
      ListTile(
        title: Text('Messages'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessageScreen()),
          );
        },
      ),
      ListTile(
        title: Text('Saved Listings'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SavedlistScreen()),
          );
        },
      ),
      ListTile(
        title: Text('Account'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountScreen()),
          );
        },
      ),
      ListTile(
  title: Text('Log Out'),
  onTap: () {
    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false, // This line removes all routes from the stack, ensuring that the user cannot navigate back to the previous screens after logging out
    );
  },
),
    ],
  ),
),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to FilterScreen when Filter button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    icon: Icon(Icons.filter_list),
                    label: Text('Filter'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle map button press
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    icon: Icon(Icons.map),
                    label: Text('Map'),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: roomListings.length,
              itemBuilder: (context, index) {
                return RoomListingWidget(roomListing: roomListings[index]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddDialog();
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Set the background color of the FAB
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Set FAB location
    );
  }
}

class RoomListingWidget extends StatefulWidget {
  final RoomListing roomListing;

  RoomListingWidget({required this.roomListing});

  @override
  _RoomListingWidgetState createState() => _RoomListingWidgetState();
}

class _RoomListingWidgetState extends State<RoomListingWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              // Handle user profile tap, e.g., navigate to user profile screen
              print('User profile tapped');
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.roomListing.userProfileImage),
              ),
              title: Text(widget.roomListing.userName),
              subtitle: Text('Posted on: ${DateTime.now().toString()}'),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    widget.roomListing.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.roomListing.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price: ${widget.roomListing.price}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Availability: ${widget.roomListing.availability}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Additional Information:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          widget.roomListing.additionalInfo,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle save button press
                  print('Save button pressed');
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle not interested button press
                  print('Not Interested button pressed');
                },
                child: Text('Not Interested'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle chat button press
                  print('Chat the Landlord button pressed');
                },
                child: Text('Chat'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddDialog extends StatefulWidget {
  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _availabilityController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Listing'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _availabilityController,
              decoration: InputDecoration(labelText: 'Availability (Yes/No)'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter description here',
                border: OutlineInputBorder(),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _saveListing,
          child: Text('Save'),
        ),
      ],
    );
  }

  void _saveListing() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final title = _titleController.text;
    final price = _priceController.text;
    final availability = _availabilityController.text;
    final description = _descriptionController.text;

    final url = Uri.parse('http://nveah1.helioho.st/insert_listing.php');

    try {
      final response = await http.post(
        url,
        body: {
          'title': title,
          'price': price,
          'availability': availability,
          'description': description,
        },
      );

      if (response.statusCode == 200) {
        print('New listing added successfully!');
        Navigator.of(context).pop();
      } else {
        setState(() {
          _errorMessage = 'Failed to add listing: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}