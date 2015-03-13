$(function() {

    Pusher.log = function(message) {
        console.log('message from pusher log:', message);
    };

    var pusher = new Pusher('54b6ac37e18c5fb6ce23');
    var channel = pusher.subscribe('flamingmoe');
        console.log('got data from pusher:', data);
    });
});
