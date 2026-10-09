// Modelo que representa la informacion de una compra realizada
class CompraModel {
  // Atributos con los datos ingresados por el usuario
  final String nombreProducto;
  final double precio;
  final int cantidad;
  final double porcentajeDescuento;

  // Atributos con los valores calculados
  final double subtotal;
  final double descuento;
  final double total;

  // Constructor con parametros requeridos
  CompraModel({
    required this.nombreProducto,
    required this.precio,
    required this.cantidad,
    required this.porcentajeDescuento,
    required this.subtotal,
    required this.descuento,
    required this.total,
  });
}
