import 'package:flutter/material.dart';
import 'pantalla/pantalla_inicio.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palabra Invertida',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PantallaInicio(),
    );
  }
}
