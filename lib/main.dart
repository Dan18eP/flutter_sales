import 'package:flutter/material.dart';
import 'screens/registro_screen.dart';

// Punto de entrada principal de la aplicacion Flutter
void main() {
  runApp(const MiAplicacionCompra());
}

// Widget raiz que configura MaterialApp y el tema visual
class MiAplicacionCompra extends StatelessWidget {
  const MiAplicacionCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Compras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
      ),
      // Definimos la pantalla de registro como la pantalla inicial
      home: const RegistroScreen(),
    );
  }
}
