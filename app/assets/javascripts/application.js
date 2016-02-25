//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .

var app = function() {
  console.log("initialize");

  $("body").topic();
  
  var editing = false;
  $("[data-edit]").edit_button();
  
}

$(document).ready(app);






