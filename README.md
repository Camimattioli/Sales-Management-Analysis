# Análisis de la Gestión Comercial de AdventureWorks

Análisis de causa raíz sobre la caída en las ventas de AdventureWorks, 
realizado a partir de un requerimiento gerencial: identificar en qué canal, 
región o categoría de producto se concentra la baja, y recomendar una 
decisión estratégica para revertirla.

## Contexto / El problema

Al revisar el cierre acumulado del período, la Dirección Comercial detectó 
una variación mensual negativa y fuertes oscilaciones en la 
facturación total. Antes de recortar presupuestos, se solicitó un Análisis 
de Causa Raíz para entender dónde se estaba perdiendo valor y qué acciones 
inmediatas tomar.

## Objetivos

Trabajando sobre el modelo relacional en Power BI, se resolvieron los 
siguientes puntos:

1. **Identificación de canales**: separar el negocio entre la fuerza de 
   ventas física (canal Personal) y el canal digital/web, para determinar 
   cuál está impactando negativamente.
2. **Estadística descriptiva y KPIs**: calcular el Ticket Promedio y la 
   Cantidad de Productos por Pedido, para evaluar la eficiencia de la fuerza 
   de ventas y el comportamiento del cliente.
3. **Análisis de causa raíz (geográfico y de producto)**: determinar en qué 
   regiones y subcategorías específicas se concentra el problema.

## Herramientas utilizadas
- SQL Server (extracción y transformación de datos)
- Power BI Desktop (modelado y visualización)
- Metodología de los 5 Por qué (Root Cause Analysis)

## Estructura del análisis
- **Consultas SQL**: extracción de ventas, productos, categorías, personas 
  y territorios desde la base AdventureWorks (`Consultas_SQL.sql`).
- **Dashboard**: KPIs de ventas, evolución mensual por canal, distribución 
  por categoría y por región.
- **Análisis de causa raíz**: cadena de "5 Por qué" para llegar a la causa 
  específica de la caída.
- **Recomendación estratégica**: decisión de negocio basada en los hallazgos.

## Consultas SQL
Las consultas utilizadas para extraer y transformar los datos están en 
este repositorio: `Consultas_SQL.sql`. Incluyen la extracción de ventas por 
pedido, catálogo de productos y categorías, datos de vendedores/clientes y 
territorios de venta.

## Dashboard

Principales KPIs relevados: Ventas totales, Variación mensual, 
Transacciones, Ticket Medio, Cantidad Media, Vendedores. El dashboard 
permite filtrar por canal (Digital / Personal), categoría de producto y 
región.

## Análisis de Causa Raíz (5 Por qué)

1. **Las ventas vienen bajando mensualmente.**
   ¿Por qué? Hay una oscilación en montos y cantidades en el último año y medio.

2. ¿Por qué? La venta media y la cantidad media han bajado abruptamente mes a mes.

3. ¿Por qué? Tenemos una contradicción: mientras bajan cantidades y montos, 
   aumentan las transacciones.

4. ¿Por qué? El canal Digital es el que ha aumentado las transacciones y 
   sostenido las cantidades y montos de venta.

5. ¿Por qué? El canal Personal está registrando mucha inconsistencia en el 
   flujo de ventas.

**Problema identificado:** el canal Personal presenta inconsistencia en su 
flujo de ventas, mientras que el canal Digital se mantiene estable y en 
crecimiento.

## Profundizando la causa: ¿por qué es inconsistente el canal Personal?

Se filtró el dashboard por canal Personal 
y se analizaron 3 hipótesis por separado:

**¿Es un problema de vendedores?**
Se comparó el Ticket Medio y la Cantidad Media de los 17 vendedores del 
canal Personal. Los valores muestran una distribución pareja y decreciente, sin ningún vendedor claramente aislado del resto. 

**¿Es un problema de región?**
Se comparó la participación de cada región dentro del canal Personal contra 
el total general. North America y Europe se mantienen relativamente 
estables. Pacific muestra baja participación del canal Personal, pero al revisar la evolución mensual, esta 
baja participación es estructural, se mantuvo estable durante todo el 
período, no es un deterioro reciente.

**¿Es un problema de categoría de producto?**
Se comparó la mezcla de categorías (Bikes, Components, Clothing, 
Accessories) dentro del canal Personal contra el total general. La 
proporción se mantiene estable entre ambas vistas. 

**Conclusión:** ninguna causa puntual (un vendedor, una región o una 
categoría) explica el deterioro reciente del canal Personal. La 
inconsistencia responde a un fenómeno más amplio: una 
migración generalizada del comportamiento de compra hacia el canal 
Digital, que el canal Personal todavía no logró compensar (ticket medio, conversión, etc.).

## Recomendación estratégica

En lugar de invertir en corregir un vendedor, región o producto puntual 
(no hay evidencia de una falla localizada), se recomienda redirigir 
presupuesto a fortalecer la eficiencia del canal Personal. Por ejemplo, 
capacitación en venta cruzada/upselling para elevar el ticket medio, o 
reforzar la inversión en el canal Digital, que ya demostró sostener el 
crecimiento del negocio.

## Dashboard

![Dashboard general](dashboard.png)

![Dashboard filtrado por canal Personal](region-canal-personal.png)


