import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final String titel;

  HomePage({Key? key, this.titel = 'Hppsy Examen App'}) : super(key: key){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(titel)),


        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text('Menü',
                        style: TextStyle(color: Colors.white, fontSize: 24))
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Startseite'),
                  onTap: () => Navigator.pop(context),
                )
              ],)
        )
    );
  }
}