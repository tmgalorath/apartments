import 'package:apartments/components/apartment_card.dart';
import 'package:apartments/screens/add_apartment_screen.dart';
import 'package:apartments/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddApartmentScreen());
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Current Apartment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ApartmentStreamBuilder(),
              ],
            ),
          ),
        ));
  }
}

class ApartmentStreamBuilder extends StatelessWidget {
  Firestore _firestore = Firestore.instance;
  static const colors = [Colors.purple, Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('apartments').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }
        var roomates = snapshot.data.documents;
        List<Widget> apartmentCards = [];
        for (var i = 0; i < roomates.length; i++) {
          var item = roomates[i];
          if (i == 1) {
            apartmentCards.add(Text(
              'Previous Apartments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
              textAlign: TextAlign.center,
            ));
          }
          apartmentCards.add(ApartmentCard(
            name: item.data['name'],
            number: 'Apt # ' + item.data['apartmentNumber'],
            date: item.data['dates'],
            address: item.data['address'],
            color: colors[i],
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen(apartmentName: item.data['name'])));
            },
          ));
        }
        return Expanded(
          child: ListView(
            children: apartmentCards,
          ),
        );
      },
    );
  }
}
