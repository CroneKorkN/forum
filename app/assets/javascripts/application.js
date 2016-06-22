// require jquery
// require bootstrap-sprockets
//= require jquery_ujs
// require turbolinks
//= require_tree .

var app = function() {
  console.log("initialize");

  $("body").topic();

  var editing = false;
  $("[data-edit]").edit_button();

  $(".user-menu-trigger").user_menu_trigger();

}

$(document).ready(app);
