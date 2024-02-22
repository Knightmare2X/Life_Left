// DynamicTable.dart
import 'package:flutter/material.dart';

class DynamicTable extends StatelessWidget {
  final int selectedAge; // Add selectedAge as a parameter
  final int endNumber;

  DynamicTable({required this.selectedAge, required this.endNumber});

  @override
  Widget build(BuildContext context) {
    // Calculate number of rows based on selected age
    final int rows = selectedAge+1;

    // Get screen size
    Size screenSize = MediaQuery.of(context).size;

    // Calculate maximum allowable width and height for the table
    double maxWidth = screenSize.width - 32.0; // Subtracting padding
    double maxHeight = screenSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;


    // Calculate width and height of each box
    double boxWidth = (maxWidth / 52); // Assuming columns remain constant at 52
    double boxHeight = maxHeight / rows;

    // Variables to store counts of red and green boxes
    int redBoxCount = 0;
    int greenBoxCount = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Table'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                children: List.generate(
                  rows,
                      (rowIndex) => TableRow(
                    children: List.generate(
                      52, // Fixed number of columns
                          (colIndex){
                        // Calculate the cell number
                        int cellNumber = colIndex + rowIndex * 52 + 1; // Adding 1 to start from 1
                        // Check if the current cell number is less than or equal to the endNumber
                        bool isRed = cellNumber <= endNumber;
                        if (isRed) {
                          redBoxCount++;
                        } else {
                          greenBoxCount++;
                        }
                        return Container(
                          width: boxWidth,
                          height: boxWidth, // Assuming square boxes
                          color: isRed ? Colors.red : Colors.green,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                    ':  You have $greenBoxCount weeks left',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                    ':  You have used $redBoxCount weeks',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20), // Add some spacing between the box and text
              Text(
                '🪔  You have only ${(greenBoxCount/52).toInt()} DIWALI!!!',
                style: TextStyle(fontSize: 20),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
