import 'package:flutter/material.dart';
import '../models/compra_model.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';

// Pantalla que muestra el detalle y los calculos finales de la compra
class ResultadoScreen extends StatelessWidget {
  // Recibimos el modelo con toda la informacion procesada
  final CompraModel compra;

  const ResultadoScreen({
    super.key,
    required this.compra,
  });

  // Metodo auxiliar para construir filas de informacion con etiqueta y valor
  Widget _construirFilaDetalle(String etiqueta, String valor, {bool esTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: TextStyle(
              fontSize: esTotal ? 18.0 : 15.0,
              fontWeight: esTotal ? FontWeight.bold : FontWeight.w500,
              color: esTotal ? Colors.blue.shade900 : Colors.black87,
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: esTotal ? 18.0 : 15.0,
              fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
              color: esTotal ? Colors.blue.shade900 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tituloResultado),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contenedor principal con los datos del producto comprado
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detalles del Producto',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 20.0),
                  _construirFilaDetalle('Producto:', compra.nombreProducto),
                  _construirFilaDetalle('Precio unitario:', '\$${compra.precio.toStringAsFixed(2)}'),
                  _construirFilaDetalle('Cantidad:', compra.cantidad.toString()),
                ],
              ),
            ),

            // Contenedor con el desglose de los calculos y el total a pagar
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resumen Financiero',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 20.0),
                  _construirFilaDetalle('Subtotal:', '\$${compra.subtotal.toStringAsFixed(2)}'),
                  _construirFilaDetalle(
                    'Descuento (${compra.porcentajeDescuento}%):',
                    '-\$${compra.descuento.toStringAsFixed(2)}',
                  ),
                  const Divider(height: 24.0, thickness: 1.5),
                  _construirFilaDetalle(
                    'Total a pagar:',
                    '\$${compra.total.toStringAsFixed(2)}',
                    esTotal: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Boton reutilizable para regresar a la pantalla anterior
            CustomButton(
              text: btnVolver,
              icon: Icons.arrow_back,
              color: Colors.blue.shade700,
              onPressed: () {
                // Navigator.pop permite volver a la pantalla anterior en la pila de navegacion
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
