# Guion Segundo a Segundo para la Grabacion del Video de Sustentacion

Este documento contiene el guion cronometrado, segundo a segundo, para la grabacion de tu video de sustentacion. Esta estructurado en dos columnas de instruccion:
1. **Accion en pantalla:** Lo que debes enfocar, abrir o presionar en el emulador/navegador y en el editor de codigo (VS Code / Android Studio).
2. **Guion de voz:** Las palabras exactas que debes pronunciar.

Duracion total estimada: 4 minutos con 30 segundos.

---

## Bloque 1: Introduccion y Presentacion del Proyecto (0:00 - 0:30)

- **Tiempo:** 0:00 - 0:15
  - **Accion en pantalla:** Mostrar la aplicacion abierta en el emulador/navegador en la pantalla de "Calculadora de Compras".
  - **Guion de voz:**
    "Cordial saludo, profesor y companeros. Mi nombre es [Tu Nombre] y a continuacion presento el desarrollo de la aplicacion movil en Flutter para el registro y calculo de compras con descuento."

- **Tiempo:** 0:15 - 0:30
  - **Accion en pantalla:** Pasar el cursor suavemente sobre el formulario.
  - **Guion de voz:**
    "El objetivo de esta practica es aplicar una estructura de proyecto organizada por capas, el uso de componentes reutilizables como campos de texto, botones y contenedores, asi como la navegacion entre pantallas y la separacion de la logica de negocio a traves de modelos y servicios."

---

## Bloque 2: Demostracion Funcional de la Aplicacion (0:30 - 2:00)

- **Tiempo:** 0:30 - 0:55
  - **Accion en pantalla:** Dejar los campos vacios y presionar el boton "Calcular compra". Mostrar el mensaje rojo de error (SnackBar) que aparece abajo.
  - **Guion de voz:**
    "Comenzamos con la validacion de datos. Si intento presionar el boton 'Calcular compra' con los campos vacios, la aplicacion no avanza y nos muestra una alerta notificando que todos los campos son requeridos. De igual forma, si ingresamos valores negativos o letras en el precio o la cantidad, el sistema valida que sean numericos positivos."

- **Tiempo:** 0:55 - 1:20
  - **Accion en pantalla:** Escribir en los campos:
    - Nombre del producto: Cuaderno
    - Precio del producto: 5000
    - Cantidad: 3
    - Porcentaje de descuento: 10
    Luego presionar el boton "Limpiar campos" y ver como se vacian.
  - **Guion de voz:**
    "Para facilitar el uso, implementamos tambien un boton de 'Limpiar campos' que vacia el formulario utilizando el metodo clear de los controladores. Vamos a digitar nuevamente: producto 'Cuaderno', precio '5000', cantidad '3' y un '10' por ciento de descuento."

- **Tiempo:** 1:20 - 1:40
  - **Accion en pantalla:** Presionar el boton "Calcular compra". La app navega fluidamente a la pantalla "Resumen de Compra".
  - **Guion de voz:**
    "Al dar clic en 'Calcular compra', la aplicacion procesa la informacion y nos desplaza mediante Navigator a la pantalla de resultados. Aqui podemos ver en dos tarjetas organizadas los datos del producto y el desglose de los calculos."

- **Tiempo:** 1:40 - 2:00
  - **Accion en pantalla:** Senalar con el cursor el Subtotal (15000.00), el Descuento (1500.00) y el Total a pagar (13500.00). Luego presionar el boton "Nueva compra".
  - **Guion de voz:**
    "El subtotal es 15,000, que resulta de multiplicar 5,000 por 3. El 10 por ciento de descuento equivale a 1,500 pesos, dejando un total final a pagar de 13,500 pesos. Si presionamos el boton 'Nueva compra', regresamos a la pantalla de registro para una nueva operacion."

---

## Bloque 3: Explicacion del Codigo y Preguntas Teoricas (2:00 - 4:15)

- **Tiempo:** 2:00 - 2:15
  - **Accion en pantalla:** Cambiar la ventana al editor de codigo (VS Code) y desplegar el arbol de carpetas dentro de `lib/`: `models/`, `screens/`, `services/`, `utils/`, `widgets/` y `main.dart`.
  - **Guion de voz:**
    "Pasemos ahora al codigo fuente. Como se puede observar, el proyecto sigue una arquitectura organizada y separada por responsabilidades, tal como se solicito en la guia de la actividad."

### Pregunta 1: ¿Que funcion cumple main.dart? (2:15 - 2:35)
- **Tiempo:** 2:15 - 2:35
  - **Accion en pantalla:** Abrir el archivo `lib/main.dart` y senalar la funcion `main()` y el widget `MaterialApp`.
  - **Guion de voz:**
    "Primero: ¿Que funcion cumple main.dart? Es el punto de inicio de la aplicacion. Contiene la funcion main que ejecuta runApp, y aqui configuramos MaterialApp con el tema visual global y definimos que RegistroScreen sea nuestra pantalla de inicio."

### Pregunta 2: ¿Que funcion cumple un Widget personalizado? (2:35 - 3:00)
- **Tiempo:** 2:35 - 3:00
  - **Accion en pantalla:** Abrir la carpeta `lib/widgets/` y mostrar `custom_text_field.dart`, `custom_button.dart` y `custom_container.dart`.
  - **Guion de voz:**
    "Segundo: ¿Que funcion cumple un widget personalizado? Nos permite encapsular componentes de interfaz repetitivos. En lugar de copiar y pegar la configuracion de cada TextField o Container, creamos widgets reutilizables como CustomTextField, CustomButton y CustomContainer. Esto reduce lineas de codigo, facilita el mantenimiento y mantiene una interfaz uniforme."

### Pregunta 3: ¿Por que se creo compra_service.dart? (3:00 - 3:20)
- **Tiempo:** 3:00 - 3:20
  - **Accion en pantalla:** Abrir `lib/services/compra_service.dart` y mostrar las funciones matematicas: `calcularSubtotal`, `calcularDescuento` y `calcularTotal`.
  - **Guion de voz:**
    "Tercero: ¿Por que se creo compra_service.dart? Se creo para separar la logica de negocio de la interfaz grafica. Las pantallas solo deben recibir y pintar datos, mientras que las operaciones matematicas de subtotal, descuento y total se realizan en esta clase de servicio, permitiendo que sea modular y comprobable con pruebas unitarias."

### Pregunta 4: ¿Que informacion almacena compra_model.dart? (3:20 - 3:40)
- **Tiempo:** 3:20 - 3:40
  - **Accion en pantalla:** Abrir `lib/models/compra_model.dart` y senalar los atributos de la clase `CompraModel`.
  - **Guion de voz:**
    "Cuarto: ¿Que informacion almacena compra_model.dart? Modela la entidad de la compra. Almacena tanto los datos de entrada: nombreProducto, precio, cantidad y porcentajeDescuento; como los calculados: subtotal, descuento y total. Esto nos permite transportar toda la transaccion agrupada en un solo objeto."

### Pregunta 5: ¿Que funcion cumple Navigator? (3:40 - 4:00)
- **Tiempo:** 3:40 - 4:00
  - **Accion en pantalla:** Abrir `lib/screens/registro_screen.dart` en la linea donde esta `Navigator.push`, y luego `lib/screens/resultado_screen.dart` donde esta `Navigator.pop`.
  - **Guion de voz:**
    "Quinto: ¿Que funcion cumple Navigator? Es el mecanismo de Flutter para administrar la pila de rutas o pantallas. Usamos Navigator.push en la pantalla de registro para colocar la pantalla de resultados encima de la pila enviandole el modelo, y usamos Navigator.pop en el boton de volver para retirar la pantalla y regresar a la anterior."

### Pregunta 6: ¿Por que se utiliza dispose()? (4:00 - 4:15)
- **Tiempo:** 4:00 - 4:15
  - **Accion en pantalla:** En `lib/screens/registro_screen.dart`, resaltar el metodo `dispose()`.
  - **Guion de voz:**
    "Sexto: ¿Por que se utiliza dispose? Se utiliza para liberar memoria cuando el widget deja de existir. En este caso liberamos los cuatro TextEditingController para evitar fugas de memoria, conocidas como memory leaks, asegurando un uso optimo de los recursos del dispositivo."

---

## Bloque 4: Cierre del Video (4:15 - 4:30)

- **Tiempo:** 4:15 - 4:30
  - **Accion en pantalla:** Regresar a la aplicacion en ejecucion o mostrar la terminal con los tests pasando.
  - **Guion de voz:**
    "Con esto queda demostrada la aplicacion funcional, la estructura por capas, los componentes reutilizables y el cumplimiento de todos los requerimientos tecnicos. Muchas gracias por su atencion."
