import 'package:Login_Screen/Screens/SecondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var regName = TextEditingController();
  var regEmail = TextEditingController();
  var regPhoneNumber = TextEditingController();
  var regPassword = TextEditingController();
  var regConformPassword = TextEditingController();

  bool _notShowPassword = true;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Registration Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  focusColor: Colors.deepPurple,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: regName,
                validator: nameValidation,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  focusColor: Colors.deepPurple,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.go,
                controller: regEmail,
                validator: emailValidation,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "PhoneNumber",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  focusColor: Colors.deepPurple,
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.newline,
                controller: regPhoneNumber,
                validator: phoneNumberValidation,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  focusColor: Colors.deepPurple,
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.send,
                obscureText: true,
                controller: regPassword,
                validator: passwordValidation,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: "Conform Password",
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    focusColor: Colors.deepPurple,
                    suffixIcon: IconButton(
                      icon: Icon(_notShowPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _notShowPassword = !_notShowPassword;
                        });
                      },
                    )),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                obscureText: _notShowPassword,
                controller: regConformPassword,
                validator: conformPasswordValidation,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if(_formKey.currentState.validate()) {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new SecondPage(
                      value: User(
                        username: regName.text ,
                        email: regEmail.text ,
                        phoneNumber: regPhoneNumber.text ,
                        password: regPassword.text ,
                        conformPassword: regConformPassword.text ,
                      ) ,
                    ) ,
                  );
                  Navigator.of(context).push(route);
                } else {
                  // validation error
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Text(
                  'Registration',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String nameValidation (String value) {
    String pattern = '''^[a-zA-Z0-9]+([_ -]?[a-zA-Z0-9])*\$''';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0) {
      return "Username is require";
    } else if(!regExp.hasMatch(value)) {
      return "Invaid UserName";
    } else
      return null;
  }

  String emailValidation (String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0) {
      return "Email is require";
    } else if(!regExp.hasMatch(value)) {
      return "Invaid Email";
    } else
      return null;
  }
  String phoneNumberValidation (String value) {
    String pattern = '''^([6-9]{1})([123456789]{1})([0-9]{8})\$''';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0) {
      return "PhoneNumber is require";
    } else if(!regExp.hasMatch(value)) {
      return "Invaid PhoneNumber";
    } else
      return null;
  }
  String passwordValidation (String value) {
    String pattern = '''^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})''';

    RegExp regExp = new RegExp(pattern);
   if(value.length == 0) {
      return "Password is require";
    } else if(!regExp.hasMatch(value)) {
      return "Invaid Password";
    } else
      return null;
  }
  String conformPasswordValidation (String value) {
    print("Test"+regPassword.text);

    if (value.length == 0) {
      return "Conform Password is require";
    } else if (value != regPassword.text) {
      return "Password dosen\'t match";
    } else
      return null;
  }
}

class User {
  final String username, email, phoneNumber, password, conformPassword;

  const User(
  {
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.conformPassword,
  });
}

