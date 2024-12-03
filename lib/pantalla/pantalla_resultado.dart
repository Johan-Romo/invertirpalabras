import 'package:flutter/material.dart';
import '../logica/logica_palabra.dart';

class PantallaResultado extends StatelessWidget {
  final String palabra;

  PantallaResultado({required this.palabra});

  @override
  Widget build(BuildContext context) {
    final List<String> letrasInvertidas = LogicaPalabra.obtenerLetrasInvertidas(palabra);

    return Scaffold(
      backgroundColor: Color(0xFF536d88) ,

      appBar: AppBar(
        title: Text('Resultado', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF0f132e),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.swap_vert,
              size: 80,
              color: Color(0xFFeac195),
            ),
            SizedBox(height: 20),
            Text(
              'Palabra ingresada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              palabra,
              style: TextStyle(fontSize: 20, color: Color(0xFF19274e), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Letras invertidas:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: letrasInvertidas.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: ListTile(
                      leading: Icon(Icons.label, color: Color(0xFFeac195)),
                      title: Text(
                        letrasInvertidas[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
