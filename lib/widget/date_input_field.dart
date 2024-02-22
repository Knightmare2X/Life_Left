import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final Function(int) onDateSelected;
  const DateInputField({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  late TextEditingController _dateController;
  late int totalWeeks;
  late int greenBox;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    totalWeeks = 0;
    greenBox= 0;// Initialize total weeks
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final currentDate = DateTime.now();
      final startYear = pickedDate.year;
      final endYear = currentDate.year;
      final startWeek = currentDate.difference(DateTime(endYear)).inDays ~/ 7;
      final endWeek = pickedDate.difference(DateTime(startYear)).inDays ~/ 7;
      final fullYears = endYear - startYear;
      final partialWeeksAtBeginning = 52 - endWeek;
      final partialWeeksAtEnd = startWeek;
      totalWeeks = (fullYears * 52) + partialWeeksAtBeginning + partialWeeksAtEnd;

      final formattedDate = DateFormat.yMMMMd().format(pickedDate);
     /* print('Selected Date: $formattedDate');
      print('full year $endWeek');
      print('Total Weeks: $totalWeeks');*/


      widget.onDateSelected(totalWeeks);

      setState(() {
        _dateController.text = formattedDate;
        print(formattedDate);
      });
    } else {
      print('Date picker cancelled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: TextFormField(
            controller: _dateController, // Use the initialized controller here
            decoration: InputDecoration(
              labelText: 'Your DOB',
            ),
          ),
        ),
      ),
    );
  }
}
