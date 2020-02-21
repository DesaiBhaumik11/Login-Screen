import 'package:Login_Screen/Screens/_registrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final User value;

  SecondPage({Key key, this.value}) : super(key : key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Page',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('USERNAME : ${widget.value.username}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('USERNAME : ${widget.value.email}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('USERNAME : ${widget.value.phoneNumber}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('USERNAME : ${widget.value.password}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('USERNAME : ${widget.value.conformPassword}',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      )
    );
  }
}
