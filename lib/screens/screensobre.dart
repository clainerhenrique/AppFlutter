import 'package:flutter/material.dart';

import '../componets/appdrawer.dart';

class ScreenSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre')),
      drawer: AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Aplicativo desenvolvido por Clainer Henrique,'
            'Version 1.0',

            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
