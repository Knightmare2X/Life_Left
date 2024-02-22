import 'package:flutter/material.dart';

class LifeInputField extends StatefulWidget {
  final void Function(int) onAgeSelected;
  const LifeInputField({Key? key, required this.onAgeSelected}) : super(key: key);

  @override
  _LifeInputFieldState createState() => _LifeInputFieldState();
}

class _LifeInputFieldState extends State<LifeInputField> {
  int _selectedAge = 20;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
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
        child: Container(
          height: 70,
          child: Center(
            child: DropdownButtonFormField<int>(

              decoration:InputDecoration.collapsed(hintText: 'Select how long you will live'),
              isExpanded: true,
              value: null,
              onChanged: (newValue) {
                setState(() {
                  _selectedAge = newValue!;
                  widget.onAgeSelected(_selectedAge);
                  print(_selectedAge);
                });
              },
              items: List.generate(
                9,
                    (index) => DropdownMenuItem(
                  value: 20 + index * 10,
                  child: Text('${20 + index * 10} years'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
