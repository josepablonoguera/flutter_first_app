import 'package:flutter/material.dart';
import 'package:flutter_taller_dos/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _txtControlUser = new TextEditingController();
  TextEditingController _txtControlPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }
/**esto es un comentario */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text("Control de Acceso"),
      ),
      body: ListView(
        children:[ Center(
          child: Card(
              shadowColor: Colors.black,
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: NetworkImage(
                          "https://cdn3.iconfinder.com/data/icons/many-peoples-vol-2/512/16-512.png"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Login del Sistema",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Usuario",
                      ),
                      controller: _txtControlUser,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Contraseña",
                      ),
                      controller: _txtControlPassword,
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => _login(), child: Text("Inciar sesión"))
                ],
              )),
        ),]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("estoy sumando");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _login() {  
   String user1 ="user1";
   String password ="123456";

   if(user1 == _txtControlUser.text && password== _txtControlPassword.text){
    Fluttertoast.showToast(
        msg: "Bienvenido al sistema",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade300,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );


   }
   else{   
     Fluttertoast.showToast(
        msg: "Usuario no valido",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade300,
        textColor: Colors.white,
        fontSize: 16.0
    );


   }

  }
}
