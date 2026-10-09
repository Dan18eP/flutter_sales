# Calculadora de Compras en Flutter

Aplicacion movil desarrollada en Flutter con arquitectura modular por capas y componentes reutilizables, disenada para calcular el valor total de una compra aplicando descuentos.

---

## Objetivo

Desarrollar una aplicacion movil en Flutter aplicando una estructura organizada de proyecto, componentes reutilizables (`CustomTextField`, `CustomContainer`, `CustomButton`), navegacion entre pantallas con `Navigator`, modelos y servicios para separar la logica de negocio de la interfaz de usuario.

---

## Logica y Formulas de Calculo

La aplicacion realiza los calculos financieros mediante la clase de servicio `CompraService`:

- **Subtotal:**
  $$\text{Subtotal} = \text{Precio} \times \text{Cantidad}$$

- **Descuento:**
  $$\text{Descuento} = \frac{\text{Subtotal} \times \text{Porcentaje de Descuento}}{100}$$

- **Total a pagar:**
  $$\text{Total} = \text{Subtotal} - \text{Descuento}$$

---

## Funcionalidades de la Aplicacion

### Pantalla 1: Registro de Compra (`RegistroScreen`)
- Formulario con campos organizados para capturar:
  - Nombre del producto.
  - Precio unitario.
  - Cantidad.
  - Porcentaje de descuento.
- Boton **Calcular compra** para procesar los datos y navegar a la pantalla de resultados.
- Boton **Limpiar campos** para reiniciar el formulario usando `TextEditingController.clear()`.
- Validaciones implementadas:
  - Verificacion de campos no vacios.
  - Comprobacion de valores numericos validos y positivos para precio, cantidad y descuento.
  - Mensajes de advertencia mediante `SnackBar`.
- Liberacion de recursos en memoria mediante `dispose()`.

### Pantalla 2: Resultado de la Compra (`ResultadoScreen`)
- Tarjetas estructuradas con el resumen completo de la transaccion:
  - Detalle del producto (nombre, precio unitario, cantidad).
  - Resumen financiero (subtotal, valor del descuento aplicado y total final a pagar).
- Boton **Nueva compra** para regresar a la pantalla anterior mediante `Navigator.pop(context)`.

---

## Estructura del Proyecto

El codigo fuente se encuentra organizado por capas de responsabilidad:

```
lib/
├── main.dart                  # Punto de entrada y configuracion de MaterialApp
├── models/
│   └── compra_model.dart      # Modelo de datos de la compra
├── services/
│   └── compra_service.dart    # Servicio con la logica y operaciones matematicas
├── widgets/
│   ├── custom_text_field.dart # Campo de texto reutilizable
│   ├── custom_button.dart     # Boton personalizado reutilizable
│   └── custom_container.dart  # Contenedor estilizado para agrupar elementos visuales
├── screens/
│   ├── registro_screen.dart   # Pantalla del formulario de registro
│   └── resultado_screen.dart  # Pantalla del desglose de resultados
└── utils/
    └── constants.dart         # Constantes de texto, etiquetas y mensajes
```

---

## Componentes Reutilizables

1. **CustomTextField:** Envuelve un `TextField` proporcionando decoracion estandar, etiqueta flotante, textos de sugerencia e iconos.
2. **CustomButton:** Envuelve un `ElevatedButton` permitiendo personalizar texto, color de fondo, icono y accion `onPressed`.
3. **CustomContainer:** Proporciona un marco visual uniforme con bordes redondeados, sombra suave y padding para estructurar secciones de la interfaz.

---

## Preguntas para la Sustentacion en Video

1. **¿Que funcion cumple main.dart?**
   Es el punto de entrada de la aplicacion Flutter. Contiene la funcion `main()`, que ejecuta `runApp()` y carga el widget `MaterialApp`, donde se definen configuraciones globales como el tema visual y la pantalla inicial (`RegistroScreen`).

2. **¿Que funcion cumple un Widget personalizado?**
   Permite empaquetar codigo visual y logico para reutilizarlo en multiples pantallas sin duplicar codigo. Facilita el mantenimiento centralizado del diseno y hace que el codigo de las vistas sea mas limpio y legible.

3. **¿Por que se creo compra_service.dart?**
   Para implementar el principio de separacion de responsabilidades. La interfaz de usuario solo debe capturar y presentar datos, mientras que el servicio se encarga exclusivamente de las formulas matematicas y calculos de negocio.

4. **¿Que informacion almacena compra_model.dart?**
   Almacena los datos estructurados de la transaccion, tanto los datos de entrada (`nombreProducto`, `precio`, `cantidad`, `porcentajeDescuento`) como los valores calculados (`subtotal`, `descuento`, `total`), facilitando el envio de informacion entre pantallas.

5. **¿Que funcion cumple Navigator?**
   Administra la pila de pantallas de la aplicacion:
   - `Navigator.push()` agrega una nueva pantalla en la pila para mostrar los resultados.
   - `Navigator.pop()` remueve la pantalla actual para volver a la pantalla anterior.

6. **¿Por que se utiliza dispose()?**
   Para liberar los `TextEditingController` de la memoria cuando el widget se destruye, previniendo fugas de memoria (*memory leaks*).

---

## Como Ejecutar el Proyecto

### Ejecutar en Google Chrome (Web)
```powershell
flutter run -d chrome
```

### Ejecutar en Dispositivo Fisico o Emulador Android
```powershell
flutter run
```

### Ejecutar Pruebas Automatizadas
```powershell
flutter test
```

### Analisis Estatico de Codigo
```powershell
flutter analyze
```
