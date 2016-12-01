$(document).ready(function() {

  $('#header').after('<p><em>This is new text added in jQuery!</em></p>');

  $("#list").after('<p><em>Click to hide list items</em></p>');

  $('img').click(function() {
    $(this).fadeToggle('slow');
  });

  $('ul li').click(function(){
    $(this).slideToggle();
  });

  $('#header').click(function() {
    $(this).css({'color': 'red'});
  });

  $('p:not(:first)').click(function() {
    $(this).css({'color': 'blue'});
  });

});