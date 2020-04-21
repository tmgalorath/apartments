import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddApartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;
    String apt;
    String address;
    String dates;
    Firestore _firestore = Firestore.instance;
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Register a new apartment!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(hintText: 'name'),
              ),
              TextField(
                onChanged: (value) {
                  apt = value;
                },
                decoration: InputDecoration(hintText: 'apt #'),
              ),
              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(hintText: 'address'),
              ),
              TextField(
                onChanged: (value) {
                  dates = value;
                },
                decoration: InputDecoration(hintText: 'dates'),
              ),
              RaisedButton(
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  try {
                    _firestore.collection('apartments').add({
                      'name': name,
                      'apartmentNumber': apt,
                      'address': address,
                      'dates': dates,
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.blue,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white),
      ),
    );
  }
}
