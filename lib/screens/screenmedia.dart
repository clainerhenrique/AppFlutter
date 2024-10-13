import 'package:flutter/material.dart';
import '../componets/appdrawer.dart';

class ScreenMedia extends StatefulWidget {
  @override
  _ScreenMediaState createState() => _ScreenMediaState();
}

class _ScreenMediaState extends State<ScreenMedia> {
  double litros = 0, km = 0, media = 0;
  List<Map<String, double>> resultados = [];

  void calcularMedia() {
    if (litros > 0 && km > 0) {
      setState(() {
        media = km / litros;
        resultados.add({'km': km, 'litros': litros, 'media': media});
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Insira valores válidos para quilômetros e litros!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void removerResultado(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Item'),
          content: Text('Tem certeza que deseja remover este item?'),
          actions: <Widget>[
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                setState(() {
                  resultados.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Consumo'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Km Rodados',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  km = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Litros de Combustível',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  litros = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcularMedia,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Calcular e Adicionar'),
            ),
            SizedBox(height: 24),
            Expanded(
              child: resultados.isNotEmpty
                  ? ListView.builder(
                itemCount: resultados.length,
                itemBuilder: (context, index) {
                  final item = resultados[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Km: ${item['km']!.toStringAsFixed(2)} km\nLitros: ${item['litros']!.toStringAsFixed(2)} L\nMédia: ${item['media']!.toStringAsFixed(2)} Km/L',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removerResultado(index),
                      ),
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'Nenhum cálculo realizado.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
