# Documentación de Negocio - Calculadora de Compras

**Proyecto:** Calculadora de Compras en Flutter  
**Versión del Documento:** 1.0.0  
**Fecha de Actualización:** 08/10/2026  
**Área:** Negocio / Producto / Requerimientos  

---

## 1. Resumen Ejecutivo y Propósito del Producto

La **Calculadora de Compras** es una solución digital móvil y web concebida para brindar agilidad, precisión y transparencia en el cálculo comercial de compras de productos con aplicación de descuentos.

En entornos comerciales minoristas, ventas rápidas, cotizaciones de mostrador o compras cotidianas, los errores de cálculo manual o la falta de claridad en el desglose de descuentos generan desconfianza, pérdidas monetarias o demoras en el servicio. Este aplicativo resuelve dicha problemática ofreciendo una herramienta intuitiva que consolida la captura, validación, cálculo automático y presentación discriminada de los valores a pagar.

### 1.1 Objetivos de Negocio
- **Agilizar el proceso de cotización:** Reducir a menos de 5 segundos el tiempo requerido para determinar el total a pagar de un producto con descuento.
- **Minimizar el error humano:** Eliminar discrepancias contables en el cálculo de subtotal y porcentajes de descuento mediante un motor de cálculo centralizado.
- **Transparencia hacia el consumidor:** Mostrar de manera clara y desglosada el valor base (subtotal), el monto exacto ahorrado (descuento) y el importe neto final (total a pagar).
- **Usabilidad y ergonomía:** Proporcionar una experiencia fluida con controles táctiles optimizados, validaciones preventivas en tiempo real y limpieza rápida de datos para transacciones sucesivas.

---

## 2. Mapa de Actores y Usuarios Clave

| Actor | Perfil | Necesidad Principal | Valor Entregado |
| :--- | :--- | :--- | :--- |
| **Cliente / Comprador** | Persona que adquiere bienes en comercios físicos o virtuales. | Saber con certeza cuánto dinero va a pagar y cuánto se está ahorrando gracias a la promoción. | Visualización clara del subtotal, el ahorro monetario exacto y el total a pagar. |
| **Comerciante / Vendedor** | Operador de punto de venta o asesor comercial independiente. | Realizar cálculos rápidos sin depender de calculadoras manuales propensas a errores. | Validación automática de montos, prevención de entradas erróneas y reinicio instantáneo de campos. |
| **Administrador / Negocio** | Propietario o gerente de la unidad comercial. | Estandarizar la política de descuentos y liquidación de productos. | Garantía de aplicación exacta de las fórmulas financieras corporativas. |

---

## 3. Alcance del Sistema

### 3.1 Funcionalidades Incluidas (En Alcance)
1. **Captura de Datos Comerciales:**
   - Nombre o referencia descriptiva del producto.
   - Precio unitario en moneda de curso corriente.
   - Cantidad de unidades a adquirir (valores enteros positivos).
   - Porcentaje de descuento aplicable (0% al 100%).
2. **Validaciones Preventivas de Negocio:**
   - Detección obligatoria de campos vacíos.
   - Restricción estricta de valores negativos o ceros en precio y cantidad.
   - Aceptación de descuentos iguales o superiores a 0%.
   - Notificaciones contextuales al usuario cuando los datos no cumplen las reglas de negocio.
3. **Cálculo Financiero Instantáneo:**
   - Determinación del subtotal bruto.
   - Determinación del monto exacto descontado.
   - Determinación del saldo neto a cancelar.
4. **Resumen y Comprobante Visual de la Transacción:**
   - Vista estructurada con división entre datos del artículo y balance financiero.
   - Formateo estandarizado a dos cifras decimales.
5. **Navegación y Operabilidad Comercial:**
   - Transición fluida a la pantalla de resultados.
   - Botón de retorno seguro para iniciar una nueva compra manteniendo la integridad del flujo.
   - Mecanismo de borrado rápido de formulario para agilizar la atención continua.

### 3.2 Funcionalidades No Incluidas (Fuera de Alcance)
- Persistencia en bases de datos externas o almacenamiento local permanente de compras pasadas.
- Integración con pasarelas de pago electrónico (PSE, tarjetas de crédito/débito).
- Impresión de facturas electrónicas o integración con impresoras POS.
- Manejo simultáneo de carritos con múltiples productos heterogéneos (el alcance actual se enfoca en transacciones por ítem individual con cantidad variable).

---

## 4. Reglas de Negocio (RN)

```
       [Entrada de Datos]
        │  • Nombre del producto
        │  • Precio unitario
        │  • Cantidad
        │  • % Descuento
        ▼
   [Validaciones RN-01, RN-02, RN-03]
        │
   ┌────┴──────────────────────────┐
   │ ¿Cumple reglas?               │
   ├───────────────┬───────────────┤
   │ NO            │ SÍ            │
   ▼               ▼               
[Alerta SnackBar] [Motor de Cálculo: RN-04]
                  │ Subtotal = Precio × Cantidad
                  │ Descuento = Subtotal × (% / 100)
                  │ Total = Subtotal - Descuento
                  ▼
                 [Visualización RN-05]
                 (Dos decimales, formato monetario)
```

### RN-01: Obligatoriedad e Integridad de Datos
- **Descripción:** Ningún cálculo comercial puede ejecutarse si falta alguno de los cuatro parámetros fundamentales (nombre, precio, cantidad o porcentaje de descuento).
- **Justificación:** Prevenir inconsistencias o cálculos incompletos que confundan al cliente o al vendedor.
- **Comportamiento ante incumplimiento:** El sistema bloquea el avance y despliega la notificación: *"Por favor complete todos los campos"*.

### RN-02: Consistencia Cuantitativa de Magnitudes
- **Descripción:** El precio unitario debe ser un valor decimal estrictamente mayor que cero ($> 0$). La cantidad de unidades debe ser un número entero estrictamente mayor que cero ($> 0$).
- **Justificación:** En una transacción de venta comercial real no es admisible la facturación de artículos con precio cero o negativo, ni de cantidades nulas o negativas.
- **Comportamiento ante incumplimiento:** El sistema bloquea el cálculo y despliega: *"Precio, cantidad y descuento deben ser numeros validos y mayores o iguales a cero"*.

### RN-03: Rango Admisible de Descuentos
- **Descripción:** El porcentaje de descuento debe ser mayor o igual a cero ($\ge 0$) y representar una proporción porcentual hasta el 100%.
- **Justificación:** Un descuento no puede ser un valor negativo (pues constituiría un recargo encubierto no contemplado bajo este concepto).
- **Comportamiento ante incumplimiento:** Notificación de datos inválidos.

### RN-04: Fórmulas Financieras de Liquidación
El motor de negocio aplica obligatoriamente las siguientes operaciones matemáticas:

1. **Subtotal Bruto ($S$):**
   $$S = P \times C$$
   Donde $P$ es el precio unitario y $C$ es la cantidad de unidades.

2. **Monto del Descuento ($D$):**
   $$D = \frac{S \times d\%}{100}$$
   Donde $d\%$ es la tasa porcentual de descuento ingresada.

3. **Total Neto a Pagar ($T$):**
   $$T = S - D$$
   Donde el total neto corresponde al subtotal deduciendo el valor del descuento otorgado.

### RN-05: Políticas de Presentación Monetaria
- **Descripción:** Todos los valores numéricos monetarios resultantes (precio unitario, subtotal, valor del descuento y total a pagar) deben presentarse ante el usuario prefijados por el símbolo de moneda (`$`) y formateados con exactamente dos posiciones decimales (`.00`).
- **Justificación:** Uniformidad contable y facilidad de lectura para clientes y comerciantes.

---

## 5. Casos de Uso del Negocio

### CU-01: Registro y Cálculo de Compra con Descuento
- **Actor Principal:** Usuario (Comprador / Vendedor).
- **Precondición:** La aplicación se encuentra en la pantalla de registro (`RegistroScreen`).
- **Flujo Principal:**
  1. El usuario introduce el nombre del producto (ej: *"Camisa Polo"*).
  2. El usuario introduce el precio unitario (ej: `45000`).
  3. El usuario especifica la cantidad de unidades (ej: `2`).
  4. El usuario indica el porcentaje de descuento (ej: `15`).
  5. El usuario pulsa la acción **Calcular compra**.
  6. El sistema valida el cumplimiento de RN-01, RN-02 y RN-03.
  7. El sistema ejecuta las operaciones de RN-04.
  8. El sistema redirige automáticamente al usuario a la vista de resultados (`ResultadoScreen`), exhibiendo el desglose completo.
- **Flujo Alterno (Datos vacíos o inválidos):**
  - En el paso 6, si algún campo está en blanco o contiene caracteres no numéricos o negativos, el sistema emite una alerta flotante en color de advertencia y mantiene al usuario en el formulario con sus datos previos para que pueda corregirlos.

### CU-02: Limpieza Rápida del Formulario
- **Actor Principal:** Usuario.
- **Precondición:** El formulario contiene información en uno o más campos.
- **Flujo Principal:**
  1. El usuario pulsa la acción **Limpiar campos**.
  2. El sistema vacía instantáneamente los 4 campos de entrada.
  3. El formulario queda listo para un nuevo registro sin necesidad de borrar carácter por carácter.

### CU-03: Visualización del Resumen Financiero y Detalle de la Compra
- **Actor Principal:** Usuario.
- **Precondición:** Los cálculos se realizaron exitosamente en CU-01.
- **Flujo Principal:**
  1. El sistema presenta la tarjeta de **Detalles del Producto** (Nombre, Precio unitario, Cantidad).
  2. El sistema presenta la tarjeta de **Resumen Financiero** (Subtotal, Descuento discriminado en valor y porcentaje, Total final a pagar resaltado en negrita y color distintivo).
  3. El usuario valida los valores presentados.

### CU-04: Retorno a Nueva Compra
- **Actor Principal:** Usuario.
- **Precondición:** El usuario se encuentra en la pantalla `ResultadoScreen`.
- **Flujo Principal:**
  1. El usuario pulsa el botón **Nueva compra**.
  2. El sistema retorna inmediatamente a la pantalla inicial de registro preservando la estabilidad de la aplicación.

---

## 6. Historias de Usuario (User Stories con Criterios de Aceptación)

### HU-01: Registro de Producto y Estimación Rápida
> **Como** vendedor de mostrador  
> **Quiero** ingresar el nombre, precio y cantidad de un producto en un formulario sencillo  
> **Para** calcular el importe total sin demoras y evitar errores manuales.

**Criterios de Aceptación (Gherkin / BDD):**
- **Escenario 1: Cálculo exitoso sin descuento**
  - **Dado** que me encuentro en la pantalla de Registro de Compra
  - **Cuando** ingreso nombre: "Cuaderno", precio: "5000", cantidad: "3" y descuento: "0"
  - **Y** pulso el botón "Calcular compra"
  - **Entonces** el sistema navega a la pantalla de Resumen
  - **Y** muestra un Subtotal de "$15000.00", Descuento de "$0.00" y Total de "$15000.00".

- **Escenario 2: Campos en blanco**
  - **Dado** que tengo el campo de precio vacío
  - **Cuando** presiono el botón "Calcular compra"
  - **Entonces** el sistema no navega a otra pantalla
  - **Y** muestra el mensaje: *"Por favor complete todos los campos"*.

---

### HU-02: Aplicación Transparente de Descuento Promocional
> **Como** cliente comprador  
> **Quiero** ingresar o recibir un porcentaje de descuento sobre mi compra  
> **Para** saber con exactitud cuánto dinero ahorro y cuál es mi monto final neto a pagar.

**Criterios de Aceptación (Gherkin / BDD):**
- **Escenario 1: Aplicación de descuento comercial válido**
  - **Dado** que registro un producto con valor de "$2000.00", cantidad "2" y un descuento del "10%"
  - **Cuando** pulso el botón "Calcular compra"
  - **Entonces** el sistema calcula: Subtotal = "$4000.00", Descuento = "-$400.00" y Total = "$3600.00"
  - **Y** en la pantalla de resultados se indica expresamente: "Descuento (10.0%): -$400.00".

- **Escenario 2: Ingreso de valor negativo en descuento**
  - **Dado** que ingreso "-5" en el campo de descuento
  - **Cuando** pulso el botón "Calcular compra"
  - **Entonces** el sistema rechaza la operación
  - **Y** exhibe el mensaje: *"Precio, cantidad y descuento deben ser numeros validos y mayores o iguales a cero"*.

---

### HU-03: Restablecimiento Rápido de Formulario
> **Como** usuario continuo del aplicativo  
> **Quiero** poder borrar todos los campos con un solo toque  
> **Para** realizar cálculos sucesivos de diferentes productos de forma ágil.

**Criterios de Aceptación (Gherkin / BDD):**
- **Escenario 1: Limpieza total de controladores**
  - **Dado** que los cuatro campos contienen datos ingresados
  - **Cuando** pulso el botón "Limpiar campos"
  - **Entonces** los campos de Nombre, Precio, Cantidad y Descuento quedan vacíos de inmediato.

---

### HU-04: Navegación de Retorno para Nueva Compra
> **Como** usuario en la pantalla de resultados  
> **Quiero** tener un botón claro para regresar al registro  
> **Para** iniciar una nueva transacción sin perder el control de la aplicación.

**Criterios de Aceptación (Gherkin / BDD):**
- **Escenario 1: Regreso seguro a la pantalla de origen**
  - **Dado** que estoy consultando el Resumen de Compra
  - **Cuando** pulso el botón "Nueva compra"
  - **Entonces** el sistema regresa a la pantalla de registro mediante desapilado (`Navigator.pop`).

---

## 7. Glosario de Negocio

- **Subtotal:** Valor bruto de la adquisición antes de aplicar deducciones, rebajas o impuestos. Resulta de la multiplicación directa entre precio unitario y unidades solicitadas.
- **Descuento Comercial:** Reducción porcentual autorizada sobre el subtotal bruto como beneficio promocional o fidelización del cliente.
- **Total a Pagar:** Saldo neto adeudado que el comprador debe cancelar para liquidar la compra.
- **Cotización:** Estimación anticipada del costo de una compra sujeta a condiciones comerciales específicas.
- **Validación Preventiva:** Verificación automática de datos de entrada previa a cualquier procesamiento, garantizando la salud de los cálculos del negocio.
