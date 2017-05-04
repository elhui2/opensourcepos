Open Source POS

Modifico el p2 para vender boletos todo esta basado en la version Version 3.0.2 de https://github.com/jekkos/opensourcepos voy a comentar los metodos y clases que modifique.

Nueva tabla tickets
Controlador Tickets
Modelo Tickets_tb

Se usa el plugin jQuery Seat Charts para seleccionar los boletos
Las funciones van de las 12:00 a las 23:00 estan predefinidas
Los asientos van numerados del 1 al 25 y acomodados segun el diagrama
'a_a_a',
'_a_a_',
'a_a_a',
'_a_a_',
'a_a_a',
'_a_a_',
'__a_a',
'_a_a_',
'__a_a',
'_a_a_',
'__a_a'


Bugs de version 0.4

- El bloqueo de continuar con la venta sin seleccionar lugar, no funciona (solo da aviso).
- La cancelación genera folios no utilizados.
- Solicitar que cuando sea función el sistema pida horario, de no seleccionarlo no permita continuar. 
- Cuando se solicita demanda no genera folio de boletos.
- Corte de boletos.
- Falta app lectora de código de barras que cancele en sistema el boleto una vez escaneado.

¿Cual es el plan?

Usar http://ulocation.rebootproject.mx para mostrar donde están las salas y hacer un booking y pago mediante alguna pasarela de pago.

- El sistema debe estar en algun servidor para que la base de datos sea accesible para todos los puntos de venta.
- Tabla de salas (places en uLocation puede ser buena referencia).
- Paypal, conekta
- Login por email y facebook
- Definir el numero de asientos y distribucion de las salas

