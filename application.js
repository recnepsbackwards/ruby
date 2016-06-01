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
//= require turbolinks
//= require_tree .
var a = ["Sickest ninja injury this century, enter plea lend sympathy to limper simple Simon rhyming emcees", "What up? To all rappers: shut up with your shutting up and keep your shirt on, at least a button-up", "If I had a dime for every rhymer that bust guns i'll have a cool mill for my sons in trust funds", "That  heatshop like jiffy-pop(pop) In a instant Get smoked like Winston Cigarettes Ho’s get ripped off like Nicorette (patch) In real life The real trife scene Might snatch ya life like assault machine rifle", "plot shows like robberies, In and out, 1,2,3, nobodys pleased run the cash and you won’t get a wet sweatshirt the mic is a shottie, nobody moves, nobody gets hurt"];

function choose() {
  alert(a[Math.floor(Math.random()*5)]);
}
