import '../models/compra_model.dart';

// Servicio encargado de procesar la logica de negocio y los calculos de la compra
class CompraService {
  // Metodo para calcular el subtotal (Precio x Cantidad)
  double calcularSubtotal(double precio, int cantidad) {
    return precio * cantidad;
  }

  // Metodo para calcular el valor del descuento (Subtotal x Porcentaje / 100)
  double calcularDescuento(double subtotal, double porcentajeDescuento) {
    return (subtotal * porcentajeDescuento) / 100;
  }

  // Metodo para calcular el total a pagar (Subtotal - Descuento)
  double calcularTotal(double subtotal, double valorDescuento) {
    return subtotal - valorDescuento;
  }

  // Metodo integrador que realiza todos los calculos y genera la instancia del modelo
  CompraModel procesarCompra({
    required String nombreProducto,
    required double precio,
    required int cantidad,
    required double porcentajeDescuento,
  }) {
    double subtotal = calcularSubtotal(precio, cantidad);
    double descuento = calcularDescuento(subtotal, porcentajeDescuento);
    double total = calcularTotal(subtotal, descuento);

    return CompraModel(
      nombreProducto: nombreProducto,
      precio: precio,
      cantidad: cantidad,
      porcentajeDescuento: porcentajeDescuento,
      subtotal: subtotal,
      descuento: descuento,
      total: total,
    );
  }
}
