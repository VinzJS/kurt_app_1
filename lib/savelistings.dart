import 'package:flutter/material.dart';

class SavedlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Lists'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Saved list items
          ListTile(
            title: Text('Saved List 1'),
            subtitle: Text('Tap to view list details'),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.list, color: Colors.white),
            ),
            onTap: () {
              // Navigate to list details page
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Delete"),
                      content: Text("Are you sure you want to delete this item?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement functionality to remove the list
                            Navigator.of(context).pop();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Divider(),
          // Add more list items here
        ],
      ),
    );
  }
}
