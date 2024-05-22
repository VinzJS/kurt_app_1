import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Define variables to hold filter options
  double minRent = 0.0;
  double maxRent = 1000.0;
  bool billsIncluded = false;
  bool femalesOnly = false;
  bool malesOnly = false;
  bool couplesAllowed = false;
  int minAge = 18;
  int maxAge = 100;
  bool doubleRoom = false;
  bool singleRoom = false;
  bool enSuite = false;
  bool furnished = false;
  bool unfurnished = false;
  bool sharedLivingRoom = false;
  bool sharedCR = false;
  bool wifiAvailable = false;
  DateTime? moveInDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Preferences'),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rent',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'min'),
                    onChanged: (value) {
                      setState(() {
                        minRent = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'max'),
                    onChanged: (value) {
                      setState(() {
                        maxRent = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text('Bills included'),
              value: billsIncluded,
              onChanged: (value) {
                setState(() {
                  billsIncluded = value ?? false;
                });
              },
            ),
            Text(
              'Rooms for',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Females'),
              value: femalesOnly,
              onChanged: (value) {
                setState(() {
                  femalesOnly = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Males'),
              value: malesOnly,
              onChanged: (value) {
                setState(() {
                  malesOnly = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Couples'),
              value: couplesAllowed,
              onChanged: (value) {
                setState(() {
                  couplesAllowed = value ?? false;
                });
              },
            ),
            Text(
              'Rooms suitable for ages',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'min'),
                    onChanged: (value) {
                      setState(() {
                        minAge = int.tryParse(value) ?? 18;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'max'),
                    onChanged: (value) {
                      setState(() {
                        maxAge = int.tryParse(value) ?? 100;
                      });
                    },
                  ),
                ),
              ],
            ),
            Text(
              'Room sizes',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Double'),
              value: doubleRoom,
              onChanged: (value) {
                setState(() {
                  doubleRoom = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Single'),
              value: singleRoom,
              onChanged: (value) {
                setState(() {
                  singleRoom = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('En suite'),
              value: enSuite,
              onChanged: (value) {
                setState(() {
                  enSuite = value ?? false;
                });
              },
            ),
            Text(
              'Room amenities',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Furnished'),
              value: furnished,
              onChanged: (value) {
                setState(() {
                  furnished = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Unfurnished'),
              value: unfurnished,
              onChanged: (value) {
                setState(() {
                  unfurnished = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Shared living room'),
              value: sharedLivingRoom,
              onChanged: (value) {
                setState(() {
                  sharedLivingRoom = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Shared CR'),
              value: sharedCR,
              onChanged: (value) {
                setState(() {
                  sharedCR = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Wifi availability'),
              value: wifiAvailable,
              onChanged: (value) {
                setState(() {
                  wifiAvailable = value ?? false;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Date of move in',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text(
                moveInDate == null ? 'Select Date' : moveInDate.toString(),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(top: 16.0, right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Save filter options here
                  print('Filter options saved');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 254, 253, 255), // Set background color here
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != moveInDate)
      setState(() {
        moveInDate = picked;
      });
  }
}
