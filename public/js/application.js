$(document).ready(function() {
  // submitting a new question on homepage
  $('.new_question_button').click(showNewQuestionForm);
  $('.new_question_form').submit(submitQuestion);

  // new vote for answers and questions
  $('.question_container, .best-answer-outer-container, .all_answers').on('click', '.vote-button', submitVote);

  // new comment
  $('.question_container, .best-answer-outer-container, .all_answers').on('submit', '.new-comment-form', submitComment);

  // new answer
  $('.new-answer-form').submit(submitAnswer);

  // select best answer
  $('.question_container, .best-answer-outer-container, .all_answers').on('submit', '.best-answer-form', selectBestAnswer);
});

function selectBestAnswer(event) {
  event.preventDefault();
  var url = $(this).attr('action')
  var currentAnswer = $(this).closest('.answer_container')

  $.ajax({
    method: "PUT",
    url: url
  })
  .done( function(response) {
    // replace existing best answer with new best answer
    $('.best-answer-outer-container').html('');
    $('.best-answer-outer-container').append(response['new_best_answer']);
    // remove new best answer from other questions section
    $(currentAnswer).remove();
    // add old best answer to other questions section
    $('.all_answers').append(response['old_best_answer']);
  })
  .fail( function(xhr) {
    alert('Something went wrong :(')
  })
}

function submitAnswer(event) {
  event.preventDefault();
  var newAnswer = $(this).serialize();
  var url = $(this).attr('action');
  $.post(url, newAnswer)
  .done( function(response) {
    $('.all_answers').append(response);
    $('.new-answer-form textarea').val('');
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  })
}

function submitComment(event) {
  event.preventDefault();
  var newComment = $(this).serialize();
  var url = $(this).attr('action');
  var currentCommentFormText = $(this).find("input[type='text']")
  var currentCommentContainer = $(this).prev().prev();

  $.post(url, newComment)
  .done( function(response) {
    $(currentCommentContainer).append(response);
    $(currentCommentFormText).val('');
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  })
}

function submitVote(event) {
  event.preventDefault();
  var currentForm = $(this).parent();
  var newVote = { vote_result: $(this).val() };
  var url = $(this).parent().attr('action')
  $.post(url, newVote)
  .done( function(response) {
    $(currentForm).find('.vote_count').text(response)
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  })
}

function showNewQuestionForm(event) {
  event.preventDefault();
  $(this).hide();
  $('.new_question_form').show();
}

function submitQuestion(event) {
  event.preventDefault();
  var newQuestion = $(this).serialize();
  var url = $(this).attr('action');
  $.post(url, newQuestion)
  .done( function(response) {
    $('.question-container').append(response);
    $('.new-question-input').val('');
    $('.new_question_form').hide();
    $('.new_question_button').show();
    alert('New Question Posted!');
  })
  .fail( function(xhr) {
    alert(xhr.responseText);
  });
}