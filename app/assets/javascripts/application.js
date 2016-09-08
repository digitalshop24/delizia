// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require jquery.validate.min
//= require bootstrap.min
//= require modernizr
//= require owl.carousel.min
//= require jquery.formstyler.min
//= require jquery-ui.min
//= require jQRangeSlider-min
//= require jquery.fancybox.pack
//= require engine
//= require placeholders.min

$(document).ready(function () {
    // when the load more link is clicked
	$('a.load-more').click(function (e) {

        // prevent the default click action
        e.preventDefault();

        // hide load more link
        $('.load-more').hide();

        // show loading gif
        $('.loading-gif').show();

        // get the last id and save it in a variable 'last-id'
        var last_id = $('.record').last().attr('data-id');

        // make an ajax call passing along our last user id
        $.ajax({

            // make a get request to the server
            type: "GET",
            // get the url from the href attribute of our link
            url: $(this).attr('href'),
            // send the last id to our rails app
            data: {
                start_id: last_id
            },
            // the response will be a script
            dataType: "script",

            // upon success 
            success: function () {
                // hide the loading gif
                $('.loading-gif').hide();
                // show our load more link
                $('.load-more').show();
            }
        });

    });
    $('.page-data span.edit-sym').on('click touchstart', function(){
        $(this).parent().children('.page-text-form').toggle();
        $(this).parent().children('.page-info-text').toggle();
    });

    $(document).on('click touchstart', '.menu_edit_button', function(){
        $.get($(this).data('url'));
    });

    $('#menu_link').submit('form', function(){
        $("#menu_link").modal('hide');
    });
});

function func() {
var widthmax = $('#slider2').rangeSlider("values").max;
var widthmin = $('#slider2').rangeSlider("values").min;
var lengthmax = $('#slider1').rangeSlider("values").max;
var lengthmin = $('#slider1').rangeSlider("values").min;
var type =  $('#type option:selected').text();
var zone = $('#appointment option:selected').text();
var factory =  $('#producer option:selected').text();
window.location = 'catalog?width_max=' + widthmax + '&width_min=' + widthmin + '&length_min=' + lengthmin + '&length_max=' + lengthmax + '&type=' + type + '&zone=' + zone + '&factory=' + factory;
}
