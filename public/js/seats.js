$(document).ready(function () {
    var selected, quantity, line, funcion, transaction, sc;

    $('.select-ticket').click(function () {
        quantity = $(this).attr('quantity');
        line = $(this).attr('line');
    });

    sc = $('#asientos').seatCharts({
        map: [
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
        ],
        seats: {
            a: {
                price: 99.99,
                classes: 'front-seat' //your custom CSS class
            }

        },
        click: function () {

            if (this.status() == 'available') {
                selected = sc.find('a.selected').length + 1;
                $('#seats-count').val(selected);
                if (selected <= 25) {
                    return 'selected';
                } else {
                    return;
                }

            } else if (this.status() == 'selected') {
                selected = sc.find('a.selected').length - 1;
                $('#seats-count').val(selected);
                //seat has been vacated
                return 'available';
            } else if (this.status() == 'unavailable') {
                //seat has been already booked
                return 'unavailable';
            } else {
                return this.style();
            }

        }

    });

    $('#funcion').change(function () {
        funcion = $(this).val();
        sc.find('a').status('available');
        
        console.debug(funcion);
        if (funcion == 0 || funcion == '') {
            alert('seleccionar horario');
            return;
        }

        $.getJSON('./tickets/get_used', {'time': $('#funcion').val()}, function (rest) {
            if (rest.status) {
                for (var i = 0; i < rest.response.length; i++) {
                    if (rest.response[i].status == 'used') {
                        sc.get(rest.response[i].seat).status('unavailable');
                    } else
                    if (rest.response[i].status == 'blocked') {
                        sc.get(rest.response[i].seat).status('unavailable');
                    }
                }
            }

        });
    });

    $('#save-seats').click(function () {
        console.debug(sc.find('a.selected').length);

        $('.quantity-' + line).val(sc.find('a.selected').length);

        var seats = new Array();
        sc.find('a.selected').each(function () {
            seats.push(this.node().attr('id'));
            console.debug(this.node().attr('id'));
        });

        setTimeout(function () {
            $.post('/tickets/request', {'time': $('#funcion').val(), 'seats': seats}, function (rest) {
                if (rest.status) {
                    transaction = rest.response;
                    $('#cart_' + line).submit();
                } else {
                    alert('ocurrio un error');
                }

            });
        }, 500);
    });

    $.getJSON('./tickets/get_used', {'time': $('#funcion').val()}, function (rest) {
        if (rest.status) {
            for (var i = 0; i < rest.response.length; i++) {
//                console.debug(rest.response[i].seat + rest.response[i].status);
                if (rest.response[i].status == 'used') {
                    sc.get(rest.response[i].seat).status('unavailable');
                } else
                if (rest.response[i].status == 'blocked') {
                    sc.get(rest.response[i].seat).status('unavailable');
                }

            }
        }

    });
});