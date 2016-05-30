$.fn.user_menu_trigger = function() {
  $(this).click(function(e){
    if($(e.target).is('.user-menu, .user-menu *')){
      e.preventDefault();
      return;
    }
    
    var user_menu = $(".user-menu");
    if (user_menu.hasClass("hidden")) {
      user_menu.removeClass("hidden");
    } else {
      user_menu.addClass("hidden");
    }
  });
  $(this).find(" > a").click(function(e) {
    e.preventDefault();
  });
  return this;
}