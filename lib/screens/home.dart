import 'package:flutter/material.dart';

class Home extends StatelessWidget { 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Home"),
       ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Primera fila"),
            subtitle: Text("el sub"),
            trailing: Icon(Icons.arrow_forward_ios),
            
          ),
        ],
      ),
    );
  }
}