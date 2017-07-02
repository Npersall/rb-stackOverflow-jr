$(document).ready(function() {
  // submitting a new question on homepage
  $('.new_question_button').click(showNewQuestionForm);
  $('.new_question_form').submit(submitQuestion);

  // Upvote/downvote

  // New comment

  // New answer

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
  .done( function(response) {
    $('.question-container').append(response);
    $('.new-question-input').val('');
    $('.new_question_form').css('display', 'none');
    $('.new_question_button').css('display', 'block');
    alert('New Question Posted!');
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  });
}