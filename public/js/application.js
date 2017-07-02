$(document).ready(function() {
  // submitting a new question on homepage
  $('.new_question_button').click(showNewQuestionForm);
  $('.new_question_form').submit(submitQuestion);

  // new vote for answers anq questions
  $('.vote_container form').on('click', ':submit', submitVote);

  // new comment
  $('.new-comment-form').submit(submitComment);

  // new answer

  // check things still work when new one is inserted w/o refresh

});

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
    console.log('new comment failed')
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
  $(this).css('display', 'none');
  $('.new_question_form').css('display', 'block')
}

function submitQuestion(event) {
  event.preventDefault();
  var newQuestion = $(this).serialize();
  var url = $(this).attr('action');
  $.post(url, newQuestion)
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