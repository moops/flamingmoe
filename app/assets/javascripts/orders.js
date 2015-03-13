$(function() {

    Pusher.log = function(message) {
        console.log('message from pusher log:', message);
    };

    var pusher = new Pusher('54b6ac37e18c5fb6ce23');
    var channel = pusher.subscribe('flamingmoe');
    channel.bind('sale', function(data) {
        console.log('got sale data from pusher:', data);

        $('#recent-orders tr:gt(6)').remove();

        var tr = $('<tr><td>' +
        '<p class="text-muted">' + data.sold_at + '</p>' +
        '<strong class="text-primary">' + data.name + '</strong> ' +
        'from ' + data.location + ' bought ' + data.quantity + ' ' + data.product +
        '</td></tr>');

        tr.hide();
        $('#recent-orders tbody').prepend(tr);
    });

    channel.bind('count', function(data) {
        console.log('got count data from pusher:', data);

        $('#order-count').html(data.total);
        $('#shipped-count').html(data.shipped);
    });

    $('#order_quantity').on('change', function() {
        setPrice();
    });

    $('#order_product_id').on('change', function() {
        setPrice();
    });

    var setPrice = function() {
        productId = $('#order_product_id').val();
        quantity = $('#order_quantity').val();
        unitPrice = prices[productId];
        // console.log(prices);
        // console.log('productId', productId, 'quantity', quantity, 'unitPrice', unitPrice);
        $('#order-price').val('$' + (quantity * unitPrice).toFixed(2));
    };
});
