import 'package:flutter/material.dart';
import '../models/compra_model.dart';
import '../services/compra_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../utils/constants.dart';
import 'resultado_screen.dart';

// Pantalla principal para el registro de los datos de la compra
class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  // Controladores para capturar el texto ingresado en cada campo
  final TextEditingController _cntNombre = TextEditingController();
  final TextEditingController _cntPrecio = TextEditingController();
  final TextEditingController _cntCantidad = TextEditingController();
  final TextEditingController _cntDescuento = TextEditingController();

  // Instancia del servicio que contiene la logica de calculo
  final CompraService _compraService = CompraService();

  // Metodo para liberar los controladores de memoria cuando el widget se destruye
  @override
  void dispose() {
    _cntNombre.dispose();
    _cntPrecio.dispose();
    _cntCantidad.dispose();
    _cntDescuento.dispose();
    super.dispose();
  }

  // Metodo para validar los datos e iniciar el proceso de calculo y navegacion
  void _calcularCompra() {
    // 1. Validacion: verificar que ningun campo este vacio
    String nombre = _cntNombre.text.trim();
    String strPrecio = _cntPrecio.text.trim();
    String strCantidad = _cntCantidad.text.trim();
    String strDescuento = _cntDescuento.text.trim();

    if (nombre.isEmpty || strPrecio.isEmpty || strCantidad.isEmpty || strDescuento.isEmpty) {
      _mostrarMensaje(msgCamposVacios);
      return;
    }

    // 2. Validacion: verificar que los valores sean numericos y positivos
    double? precio = double.tryParse(strPrecio);
    int? cantidad = int.tryParse(strCantidad);
    double? descuento = double.tryParse(strDescuento);

    if (precio == null || cantidad == null || descuento == null || precio <= 0 || cantidad <= 0 || descuento < 0) {
      _mostrarMensaje(msgValoresInvalidos);
      return;
    }

    // 3. Procesar los calculos mediante la clase de servicio
    CompraModel resultado = _compraService.procesarCompra(
      nombreProducto: nombre,
      precio: precio,
      cantidad: cantidad,
      porcentajeDescuento: descuento,
    );

    // 4. Navegar a la pantalla de resultados pasando el modelo calculado
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(compra: resultado),
      ),
    );
  }

  // Metodo auxiliar para mostrar mensajes de advertencia al usuario mediante SnackBar
  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red.shade700,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Metodo para limpiar el contenido de todos los campos del formulario
  void _limpiarCampos() {
    _cntNombre.clear();
    _cntPrecio.clear();
    _cntCantidad.clear();
    _cntDescuento.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tituloApp),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contenedor principal que organiza visualmente el formulario
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Datos de la Compra',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // Campo para el nombre del producto
                  CustomTextField(
                    label: labelNombreProducto,
                    hint: hintNombreProducto,
                    controller: _cntNombre,
                    keyboardType: TextInputType.text,
                    icon: Icons.shopping_bag_outlined,
                  ),

                  // Campo para el precio del producto
                  CustomTextField(
                    label: labelPrecio,
                    hint: hintPrecio,
                    controller: _cntPrecio,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    icon: Icons.attach_money,
                  ),

                  // Campo para la cantidad
                  CustomTextField(
                    label: labelCantidad,
                    hint: hintCantidad,
                    controller: _cntCantidad,
                    keyboardType: TextInputType.number,
                    icon: Icons.format_list_numbered,
                  ),

                  // Campo para el porcentaje de descuento
                  CustomTextField(
                    label: labelDescuento,
                    hint: hintDescuento,
                    controller: _cntDescuento,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    icon: Icons.percent,
                  ),

                  const SizedBox(height: 16.0),

                  // Boton reutilizable para ejecutar el calculo
                  CustomButton(
                    text: btnCalcular,
                    icon: Icons.calculate_outlined,
                    color: Colors.blue.shade700,
                    onPressed: _calcularCompra,
                  ),

                  const SizedBox(height: 10.0),

                  // Boton reutilizable para limpiar los campos del formulario
                  CustomButton(
                    text: btnLimpiar,
                    icon: Icons.cleaning_services_outlined,
                    color: Colors.grey.shade600,
                    onPressed: _limpiarCampos,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
