import 'package:flutter/material.dart';

class RoomateCard extends StatelessWidget {
  final String name;

  RoomateCard({this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            // onTap();
          },
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                  )),
              Text(
                name,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
