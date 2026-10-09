# Guia para Sustentacion en Video de la Aplicacion

Este documento contiene las respuestas a las preguntas solicitadas para el video de sustentacion, redactadas con un lenguaje claro, sencillo y tecnico a nivel de estudiante.

---

## 1. ¿Que funcion cumple main.dart?

Es el punto de entrada de toda la aplicacion Flutter. 
- Contiene la funcion `main()`, que ejecuta `runApp()`.
- Aqui se configura el widget principal `MaterialApp`, donde se definen configuraciones globales como el tema visual (colores, tipografia), el titulo de la aplicacion y la pantalla de inicio (`home`), que en este caso es `RegistroScreen`.

---

## 2. ¿Que funcion cumple un Widget personalizado?

Un widget personalizado (como `CustomTextField`, `CustomButton` o `CustomContainer`) permite encapsular la interfaz y su comportamiento para reutilizar codigo.
- Evita tener que repetir las mismas configuraciones de diseno en multiples partes de la aplicacion.
- Facilita el mantenimiento, ya que si se necesita cambiar el estilo visual de los campos o botones, solo se modifica el widget en un unico archivo.
- Mantiene las pantallas mas limpias y faciles de leer.

---

## 3. ¿Por que se creo compra_service.dart?

Se creo para aplicar el principio de separacion de responsabilidades.
- Su proposito es separar la logica de negocio (los calculos matematicos de subtotal, descuento y total) de la interfaz de usuario.
- De esta manera, las pantallas (`screens`) solo se encargan de mostrar y capturar informacion, mientras que el servicio realiza los calculos.
- Permite que la logica sea reutilizable y facilmente evaluable mediante pruebas unitarias.

---

## 4. ¿Que informacion almacena compra_model.dart?

Es una clase que modela la estructura de los datos de la compra. Almacena tanto los datos ingresados como los calculados:
- Datos de entrada:
  - `nombreProducto` (String): Nombre del articulo ingresado.
  - `precio` (double): Precio unitario del producto.
  - `cantidad` (int): Numero de unidades compradas.
  - `porcentajeDescuento` (double): Porcentaje de descuento aplicado.
- Datos calculados:
  - `subtotal` (double): Resultado de multiplicar precio por cantidad.
  - `descuento` (double): Valor en dinero que se descuenta.
  - `total` (double): Valor final a pagar.

Al encapsular estos datos en un objeto, se facilita su transferencia entre pantallas.

---

## 5. ¿Que funcion cumple Navigator?

`Navigator` es el widget de Flutter encargado de gestionar la pila de rutas (pantallas) de la aplicacion:
- `Navigator.push()`: Agrega una nueva pantalla encima de la actual en la pila de navegacion (en este caso, pasa de `RegistroScreen` a `ResultadoScreen`, enviando el modelo `CompraModel`).
- `Navigator.pop()`: Remueve la pantalla actual de la cima de la pila y regresa a la pantalla anterior (accion que realiza el boton "Nueva compra" en `ResultadoScreen`).

---

## 6. ¿Por que se utiliza dispose()?

El metodo `dispose()` se implementa en los `StatefulWidget` para liberar recursos de la memoria cuando el widget deja de existir en el arbol de widgets.
- En este proyecto se utiliza para liberar los cuatro `TextEditingController` (`_cntNombre`, `_cntPrecio`, `_cntCantidad`, `_cntDescuento`).
- Si no se liberan con `dispose()`, estos controladores permanecen en memoria consumiendo recursos innecesarios (fuga de memoria o memory leak).
- Adicionalmente, demostramos el control de estos controladores utilizando el metodo `.clear()`, asociado al boton "Limpiar campos", para vaciar los textos ingresados sin destruir el controlador.

---

## Guion Sugerido para la Grabacion del Video

1. **Introduccion (30 segundos):**
   - Presentacion personal.
   - Mencionar el objetivo: Aplicacion movil para calcular el valor total de una compra con descuento, aplicando arquitectura por capas y widgets personalizados en Flutter.

2. **Demostracion practica en el emulador / dispositivo (1 a 2 minutos):**
   - Mostrar la pantalla de registro de compra.
   - Demostrar la validacion: presionar "Calcular compra" con campos vacios para mostrar el aviso al usuario.
   - Ingresar un ejemplo real:
     - Nombre: Cuaderno
     - Precio: 5000
     - Cantidad: 3
     - Descuento (%): 10
   - Presionar "Calcular compra" y mostrar la transicion hacia la pantalla de resultado.
   - Explicar los resultados mostrados: Subtotal (15000), Descuento (1500), Total (13500).
   - Presionar el boton "Nueva compra" para demostrar el regreso a la pantalla de registro.

3. **Explicacion del codigo y respuesta a las preguntas (2 a 3 minutos):**
   - Mostrar la estructura de carpetas (`models`, `services`, `widgets`, `screens`, `utils`, `main.dart`).
   - Responder las 6 preguntas de forma pausada guiandose con las respuestas de este documento.
