import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade600,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                  'images/miguel.jpg',
                ),
                radius: 50.0,
              ),
              Text(
                'Miguel Cañon',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 35.0,
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SOFTWARE DEVELOPMENT ENGINEER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 10.0,
                  color: Colors.red.shade900,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  color: Colors.red.shade900,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.green.shade600,
                  ),
                  title: Text(
                    '+57 301 386 2438',
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.green.shade600,
                  ),
                  title: Text(
                    'michael_v613@hotmail.com',
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
