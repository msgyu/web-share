$(document).on('turbolinks:load', function() {
  $(".user_info").click(function(){
      if($(this).find(".user_info_link").attr("target")=="_blank"){
          window.open($(this).find("a").attr("href"), '_blank');
      }else{
          window.location=$(this).find("a").attr("href");
      }
  return false;
  });
})
