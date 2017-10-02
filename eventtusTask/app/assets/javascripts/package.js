// jQuery(document).ready(function($) {
    console.log( "ready!" );
    $("#add").on('click', function(e){
        $("#dependenciesDiv").append('<div><input type="text" name="package[dependencies][]"><a onclick="$(this).parent().remove()">x</a></div>');
    });
// });