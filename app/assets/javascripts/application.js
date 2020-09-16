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

//= require rails-ujs
//= require activestorage
//= require jquery-min
//= require tether.min
//= require bootstrap.min
//= require classie
//= require mixitup.min
//= require nivo-lightbox
//= require owl.carousel.min
//= require jquery.stellar.min
//= require jquery.nav
//= require smooth-scroll
//= require smooth-on-scroll
//= require wow
//= require menu
//= require jquery.vide
//= require jquery.counterup.min
//= require jquery.magnific-popup.min
//= require waypoints.min
//= require form-validator.min
//= require contact-form-script
//= require main
//
//
let allergenBtn = document.querySelector(".allergen-btn");
let allergenContainer = document.querySelector(".allergen-container");
let allergenContainerStatus = false;

function allergenContaineHappen() {
  if (allergenContainerStatus == false) {
    allergenContainer.style.display = "none";
    allergenContainerStatus = true;
  }
  else if (allergenContainerStatus == true) {
    allergenContainer.style.display = "block";
    allergenContainerStatus = false;
  }
}

allergenBtn.onclick = allergenContaineHappen;


let arachidBtn = document.querySelector(".arachid-btn");
let arachidContainer = document.querySelector(".arachid-container");
let arachidContainerStatus = false;

function arachidContaineHappen() {
  if (arachidContainerStatus == false) {
    arachidContainer.style.display = "none";
    arachidContainerStatus = true;
  }
  else if (arachidContainerStatus == true) {
    arachidContainer.style.display = "block";
    arachidContainerStatus = false;
  }
}
arachidBtn.onclick = arachidContaineHappen;