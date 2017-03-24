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

pointofsale