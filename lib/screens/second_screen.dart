import 'package:flutter/material.dart';
import 'package:flutter_taller_dos/screens/home.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "d",
      home: SecondScrenHome(),
    );
  }
}

class SecondScrenHome extends StatefulWidget {
  SecondScrenHome({Key key}) : super(key: key);

  @override
  _SecondScrenHomeState createState() => _SecondScrenHomeState();
}

class _SecondScrenHomeState extends State<SecondScrenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Home())),
        ),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text("Second Screen"),
      ),
    );
  }
}
