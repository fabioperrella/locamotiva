$(document).ready(function(){

  if($('.cpf').length){
    $(".cpf").mask("999.999.999-99");
  }

  $('form').submit(function(){
    $(".cpf").each(function(){
      $(this).val($(this).mask());
    });
    $(this).submit();
  });
});