import 'package:flutter/material.dart';
import 'package:life_left/screens/dynamic_table.dart';

import '../widget/date_input_field.dart';
import '../widget/life_input_field.dart';

class YourLife extends StatefulWidget {
  const YourLife({super.key});

  @override
  State<YourLife> createState() => _YourLifeState();
}

class _YourLifeState extends State<YourLife> {
  int _selectedAge = 20;
  int _endNumber = 5200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Your Life',
          style: TextStyle(
            fontSize: 20,
          ),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Just pick your birthdate and estimate your lifespan. The system will then create an image showing the weeks you have left and those you\'ve already used.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // Use Row widget to position the green box and text horizontally
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.green,
                  // Color the container green
                  width: 40,
                  // Set width to 5
                  height: 40, // Set height to 5
                ),
                SizedBox(width: 5), // Add some spacing between the box and text
                Text(
                  ':  Signifies weeks left',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // Use Row widget to position the green box and text horizontally
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.red,
                  // Color the container green
                  width: 40,
                  // Set width to 5
                  height: 40, // Set height to 5
                ),
                SizedBox(width: 5), // Add some spacing between the box and text
                Text(
                  ':  Signifies weeks used',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DateInputField(onDateSelected: (date) {
              setState(() {
                _endNumber = date;
              });
            }),
            SizedBox(
              height: 20,
            ),
            LifeInputField(
              onAgeSelected: (age) {
                setState(() {
                  _selectedAge = age;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DynamicTable(
                              selectedAge: _selectedAge,
                              endNumber: _endNumber,
                            )),
                  );
                },
                child: Text('Generate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
