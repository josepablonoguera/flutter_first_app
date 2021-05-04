import 'package:flutter/material.dart';
import 'package:flutter_taller_dos/screens/second_screen.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> menu = [
    ListTile(
      title: Text("          Menú"),
    ),
    ListTile(
      leading: Icon(Icons.verified_user),
      title: Text("Segunda fila"),
      subtitle: Text("el sub"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: Icon(Icons.verified_user),
      title: Text("Tercera fila"),
      subtitle: Text("el sub"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: Icon(Icons.verified_user),
      title: Text("Cuarta fila"),
      subtitle: Text("el sub"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  ];

  int _menuItem = 0;
  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 60;
  static const int _itemCount = 4;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 300,
                  color: Colors.amber.shade200,
                  child: ClickableListWheelScrollView(
                    scrollController: _scrollController,
                    itemHeight: _itemHeight,
                    itemCount: _itemCount,
                    onItemTapCallback: (index) {
                      print("onItemTapCallback index: $index");
                    },
                    child: ListWheelScrollView(
                      children: menu,
                      controller: _scrollController,
                      itemExtent: _itemHeight,
                      physics: FixedExtentScrollPhysics(),
                      overAndUnderCenterOpacity: 0.5,
                      perspective: 0.002,
                      useMagnifier: true,
                      magnification: 1.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _menuItem = index;
                        });
                        print("onSelectedItemChanged index: $index");
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Item: " + _menuItem.toString());
                    if (_menuItem == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    }
                  },
                  child: Text("Continuar")),
            ],
          ),
        ),
      ),
    );
  }
}
