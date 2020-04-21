import 'package:flutter/material.dart';

class InputCard extends StatefulWidget {
  final Function onSubmit;
  InputCard({this.onSubmit});

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  String dropdownValue = 'Kitchen';
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 150,
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                controller.clear();
                widget.onSubmit(value, dropdownValue);
              },
              decoration: InputDecoration(
                hintText: 'Enter item name',
              ),
            ),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            elevation: 0,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Kitchen', 'Living', 'Bedroom', 'Personal']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
