$.fn.topic =  function(){
  console.log($(this));
  $(this).find("[data-send-answer]").answer();
}