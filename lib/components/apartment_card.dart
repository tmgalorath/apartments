import 'package:flutter/material.dart';

class ApartmentCard extends StatelessWidget {
  String name;
  String number;
  String address;
  String date;
  Color color;
  Function onTap;
  ApartmentCard(
      {this.name,
      this.number,
      this.address,
      this.date,
      this.color,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 20,
                decoration: BoxDecoration(
                    color: this.color,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(number, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            date,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            address,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
