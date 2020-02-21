import 'package:Login_Screen/Screens/_registrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Dev Damo 1',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        accentColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var loginUsername = TextEditingController();
  var loginPassword = TextEditingController();
  bool notShowPassword = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log in Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Username",
                labelStyle: TextStyle(color: Colors.deepOrange),
                focusColor: Colors.deepPurple,
              ),
              controller: loginUsername,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.deepOrange),
                focusColor: Colors.deepPurple,
                suffixIcon: IconButton(icon: Icon(notShowPassword ? Icons
                    .visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      notShowPassword = !notShowPassword;
                    });
                  },
                )
              ),
              obscureText: notShowPassword,
              controller: loginPassword,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                  onTap: () {

                  },
                ),
                Text('  |  '),
                InkWell(
                    child: Text(
                      'Registration',
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                  onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => RegistrationScreen()));
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {

                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(60, 30, 60, 20),
                height: 50,
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
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}