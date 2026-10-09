import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_2/main.dart';
import 'package:flutter_app_2/services/compra_service.dart';

void main() {
  test('Prueba unitaria de calculos en CompraService', () {
    final service = CompraService();

    // Prueba subtotal: 1000 * 2 = 2000
    double subtotal = service.calcularSubtotal(1000.0, 2);
    expect(subtotal, 2000.0);

    // Prueba descuento: 2000 * 10% = 200
    double descuento = service.calcularDescuento(subtotal, 10.0);
    expect(descuento, 200.0);

    // Prueba total: 2000 - 200 = 1800
    double total = service.calcularTotal(subtotal, descuento);
    expect(total, 1800.0);

    // Prueba metodo integral procesarCompra
    final compra = service.procesarCompra(
      nombreProducto: 'Cuaderno',
      precio: 1000.0,
      cantidad: 2,
      porcentajeDescuento: 10.0,
    );

    expect(compra.nombreProducto, 'Cuaderno');
    expect(compra.subtotal, 2000.0);
    expect(compra.descuento, 200.0);
    expect(compra.total, 1800.0);
  });

  testWidgets('Carga inicial de la pantalla de registro', (WidgetTester tester) async {
    // Renderizamos la aplicacion
    await tester.pumpWidget(const MiAplicacionCompra());

    // Verificamos que se muestre el titulo en la barra superior
    expect(find.text('Calculadora de Compras'), findsOneWidget);

    // Verificamos que el boton de calcular exista
    expect(find.text('Calcular compra'), findsOneWidget);

    // Verificamos que el boton de limpiar campos exista
    expect(find.text('Limpiar campos'), findsOneWidget);
  });
}
