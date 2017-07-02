$(document).ready(function() {
  $('.new_question_button').click(showNewQuestionForm);
  $('.new_question_form').submit(submitQuestion);

  // Upvote/downvote doesn't reload whole page

});


function showNewQuestionForm(event) {
  event.preventDefault();
  $(this).css('display', 'none');
  $('.new_question_form').css('display', 'block')
}

function submitQuestion(event) {
  event.preventDefault();
  var new_question = $(this).serialize();
  var url = $(this).attr('action');

  $.post(url, new_question)
  .done( function() {
    alert('new question successful')
    // append new post to bottom
    // hide button
  })
  .fail( function() {
    alert('new question failed')
  });
}