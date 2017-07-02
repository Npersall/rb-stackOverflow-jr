$(document).ready(function() {
  // submitting a new question on homepage
  $('.new_question_button').click(showNewQuestionForm);
  $('.new_question_form').submit(submitQuestion);

  // new vote for answers anq questions
  $('.vote_container form').on('click', ':submit', submitVote);

  // new comment

  // new answer

});

function submitVote(event) {
  event.preventDefault();
  var current_form = $(this).parent();
  var new_vote = { vote_result: $(this).val() };
  var url = $(this).parent().attr('action')
  $.post(url, new_vote)
  .done( function(response) {
    $(current_form).find('.vote_count').text(response)
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  })
}

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