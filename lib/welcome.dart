import 'package:apartments/screens/login_screen.dart';
import 'package:apartments/screens/registration_screen.dart';
import 'package:apartments/screens/select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatelessWidget {
  final titleMap = ['New Roomates?', 'Avoid The Clutter', 'Get Organized'];
  final textMap = [
    'Meet your new best friends in style. Avoid the new room confusion',
    'Coordinate with your roomates beforehand so you know whats what in the aprtment',
    'Keep track of what you bring to the apartment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/toaster.json'),
          Container(
            height: 100,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Text(
                      titleMap[index],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      textMap[index],
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
              itemCount: 3,
              viewportFraction: 1,
              scale: 0.9,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                color: Colors.green,
              ),
              RaisedButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()));
                },
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
