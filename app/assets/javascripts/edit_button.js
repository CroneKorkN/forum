$.fn.edit_button = function() {
  $(this).click(function(){
    if ($("app-container").hasClass("editing")) {
      $("[data-editable-activate=\"button\"]").editable(false);
      $("app-container").removeClass("editing");
    } else {
      $("[data-editable-activate=\"button\"]").editable();
      $("app-container").addClass("editing");
    }
  });
}