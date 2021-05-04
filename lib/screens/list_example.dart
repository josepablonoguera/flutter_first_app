import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {
  const ListExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListExampleHome(),
    );
  }
}

class ListExampleHome extends StatefulWidget {
  ListExampleHome({Key key}) : super(key: key);

  @override
  _ListExampleHomeState createState() => _ListExampleHomeState();
}

class _ListExampleHomeState extends State<ListExampleHome> {

  List<Persona> lista = [];

  final TextEditingController _inputControllerData =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: ListView(children: [
        SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.black12,
                height: MediaQuery.of(context).size.height - 350,
                child: lista.length > 0
                    ? ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(lista[index].name),
                            subtitle: Text(lista[index].id),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  lista.remove(lista[index]);
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    : Center(
                      child: Container(
                          child: Column(
                            children: [
                              Text("Ingrese un dato"),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _inputControllerData,
                        decoration: InputDecoration(
                          icon: Icon(Icons.send),
                          hintText: 'Ingrese un dato',
                          helperText: 'Va a ser agregado en la lista',
                          counterText: '0 characters',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _agregar(),
                        child: Text("Agregar"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  _agregar() {
    setState(() {
      lista.add(new Persona("1", _inputControllerData.text, "un url"));
      _inputControllerData.text = "";
    });
  }
}

class Persona {

  final String id;
  final String name;
  final String foto;

  Persona(this.id, this.name, this.foto);

  

}
