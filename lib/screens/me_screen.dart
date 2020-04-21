import 'package:apartments/components/input_card.dart';
import 'package:apartments/components/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MeScreen extends StatefulWidget {
  MeScreen({Key key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  final myItems = [];

  Firestore _firestore = Firestore.instance;

  add(name, category) {
    
    setState(() {
      myItems.add(ItemCard(
        name: name,
        category: category,
        owner: 'Thomas',
      ));
    });
    try {
      _firestore.collection('items').add({
        'name': name,
        'category': category,
        'owner': 'Thomas',
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Room',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            'Tell your roomates what items you will be bringing to your new apartment!',
            textAlign: TextAlign.center,
          ),
          InputCard(onSubmit: add),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return myItems[index];
              },
              itemCount: myItems.length,
            ),
          )
        ],
      ),
    );
  }
}
