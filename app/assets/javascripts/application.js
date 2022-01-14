// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require rails-ujs
//= require jquery.raty.js
//= require activestorage
//= require_tree .

/* global $*/
$(function() {
    $('.slider').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 3000,
        arrows: true,
        infinite: true,
        pauseOnFocus: false,
        pauseOnHover: false,
        pauseOnDotsHover: false,
    });

    $(".slider-top").slick({
        arrows: false,
        dots: true,
        autoplay: true,
        autoplaySpeed: 1500,
        speed: 4000,
        fade: true,
        pauseOnFocus: false,
        pauseOnHover: false,
        pauseOnDotsHover: false,
    });
});

/*global lightbox*/
$(function () {
  lightbox.option({
    'alwaysShowNavOnTouchDevices': false,
    'disableScrolling': false,
    'fadeDuration': 600,
    'fitImagesInViewport': true,
    'imageFadeDuration': 600,
    'maxWidth': 400,
    'maxHeight': 400,
    'positionFromTop': 50,
    'resizeDuration': 700,
    'showImageNumberLabel': true,
    'wrapAround': true,
  });
});