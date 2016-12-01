$(document).ready(function(){
  $('img').click(function(){
    $(this).fadeToggle('slow');
  });
  $('#header').after('<p><em>New text!</em></p>');
  $("#list").after('<p><em>Click to hide list items</em></p>');
  $('ul li').click(function(){
    $(this).slideToggle();
  });
});