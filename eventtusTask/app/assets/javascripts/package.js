$( document ).ready(function() {
    console.log( "ready!" );
    $("#add").on('click', function(e){
        e.preventDefault();
        alert('clicked')
    })
});