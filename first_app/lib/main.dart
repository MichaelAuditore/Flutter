// This example is to create a simple view for an application compatible
// with IOS and Android System
// This app isn't functionally

import 'package:flutter/material.dart';

//The main function is the starting point for all our flutter apps.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.face,
            color: Colors.amber,
            size: 16.0,
          ),
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            /*image: NetworkImage(
                'https://images.unsplash.com/photo-1535498730771-e735b998cd64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),*/
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
