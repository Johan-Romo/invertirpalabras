class LogicaPalabra {
  static List<String> obtenerLetrasInvertidas(String palabra) {
    return palabra.split('').reversed.toList();
  }
}
