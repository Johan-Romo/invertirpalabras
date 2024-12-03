import 'package:flutter/material.dart';
import 'pantalla_resultado.dart';

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final TextEditingController _controladorPalabra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF536d88),
      appBar: AppBar(
        title: Text(
          'Palabra Invertida',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0f132e),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.text_fields,
              size: 80,
              color: Color(0xFF96b49c),
            ),
            SizedBox(height: 20),
            Text(
              'Ingresa una palabra:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controladorPalabra,
              decoration: InputDecoration(
                hintText: 'Escribe aquí...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward, color: Color(0xFf0f132e)),
              label: Text(
                'Ver resultado',
                style: TextStyle(color: Color(0xFf0f132e)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFeac195),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                String palabra = _controladorPalabra.text;


                if (palabra.isNotEmpty && RegExp(r'\d').hasMatch(palabra)) {
                  _mostrarAlerta(context);
                } else if (palabra.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PantallaResultado(palabra: palabra),
                    ),
                  );
                } else {
                  _mostrarAlerta(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('No se permiten números, por favor ingresa solo letras.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
