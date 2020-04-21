import 'package:apartments/components/item_card.dart';
import 'package:apartments/components/roomate_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  String apartmentName;
  RoomScreen({this.apartmentName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Text(
            apartmentName,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          RoomateStreamBuilder(),
          Text(
            'Our Aparment',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          ItemStreamBuilder(),
        ],
      ),
    );
  }
}

class ItemStreamBuilder extends StatelessWidget {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('items')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }
        var items = snapshot.data.documents;
        List<ItemCard> itemCards = [];
        for (var item in items) {
          itemCards.add(ItemCard(
            name: item.data['name'],
            category: item.data['category'],
            owner: item.data['owner']
          ));
        }
        return Expanded(
                  child: ListView(
            children: itemCards,
          ),
        );
      },
    );
  }
}

class RoomateStreamBuilder extends StatelessWidget {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('roomates')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }
        var roomates = snapshot.data.documents;
        List<RoomateCard> itemCards = [];
        for (var item in roomates) {
          itemCards.add(RoomateCard(
            name: item.data['name'],
          ));
        }
        return Column(
            children: itemCards,
          );
      },
    );
  }
}