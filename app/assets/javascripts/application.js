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
//= require turbolinks
//= require_tree .

/* global $*/
document.addEventListener("turbolinks:load", function () {
  // console.log("test");
  var lightbox2 = document.createElement("script");
  lightbox2.src = "https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.7.1/js/lightbox.min.js";
  document.head.appendChild(lightbox2);

  $(function() {
      $('.slider').slick({
          dots: true,
          autoplay: true,
          autoplaySpeed: 3000,
          arrows: true,
          infinite: true,
      });

      $(".slider-top").slick({
          dots: true,
          autoplay: true,
          autoplaySpeed: 3000,
          arrows: true,
          infinite: true,
      });
  });
});
