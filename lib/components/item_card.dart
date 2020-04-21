import 'package:apartments/shared/constants.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  String name;
  String category;
  String owner;
  ItemCard({this.name, this.category, this.owner});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(

          children: <Widget>[
          
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 50,
                width: 80,
                color: categoryToColor[category],
                child: Column( mainAxisAlignment: MainAxisAlignment.center,  children: <Widget>[
                  Text(category, style: TextStyle(color: Colors.white),),
                  Text('($owner)', style: TextStyle(color: Colors.white, fontSize: 10),)
                ],)
              ),
            ),
            Text(name, style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
