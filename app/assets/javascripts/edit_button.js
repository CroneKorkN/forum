$.fn.edit_button = function() {
  $(this).click(function(){
    if ($("body").hasClass("editing")) {
      $("[data-editable-activate=\"button\"]").editable(false);
      $("body").removeClass("editing");
    } else {
      $("[data-editable-activate=\"button\"]").editable();
      $("body").addClass("editing");
    }
  });
}