$(function() {

    Pusher.log = function(message) {
        console.log('message from pusher log:', message);
    };

    var pusher = new Pusher('54b6ac37e18c5fb6ce23');
    var channel = pusher.subscribe('flamingmoe');
    channel.bind('sale', function(data) {
        console.log('got data from pusher:', data);
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
