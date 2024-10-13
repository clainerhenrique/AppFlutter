import 'package:flutter/material.dart';
import 'package:trabalhomobilee/screens/screencalculadora.dart';
import 'package:trabalhomobilee/screens/screensobre.dart';
import 'package:trabalhomobilee/screens/screenmedia.dart';
import '/main.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text('Início'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate, color: Colors.blueAccent),
            title: Text('Calculadora'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ScreenCalculadora()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.school, color: Colors.blueAccent),
            title: Text('Calcular Média'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ScreenMedia()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.blueAccent),
            title: Text('Sobre'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ScreenSobre()),
              );
            },
          ),
        ],
      ),
    );
  }
}
