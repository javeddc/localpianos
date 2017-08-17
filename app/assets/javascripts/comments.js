$(document).ready(function() {
  if ($("#comment-template")[0]) {
    refreshComments()
    // setTimeout(function() {
      lightGallery(document.getElementById('lightgallery'));
      console.log("inere");
    // }, 3000)
  }
})

function refreshComments() {
  var source = $("#comment-template").html();
  var template = Handlebars.compile(source);
  var settings = {
    url: '/api_piano_comments',
    data: {
      pianoId: $('#pianoId').val()
    }
  }
  $.ajax(settings).done(function(result) {
    if (result.length != 0) {
      var commentBox = $("#comment-box");
      commentBox.html("")
      _.each(result, function(comment) {
        commentBox.append(template(comment))
      })
    }
  })
}

function postComment() {
  var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
  $("#post-btn").prop('disabled', true);
  var body = $("#comment-input").val()
  var settings = {
    url: '/api_piano_comments',
    data: {
      authenticity_token: AUTH_TOKEN,
      piano_id: $('#pianoId').val(),
      body: body
    }
  }
  $.post(settings).done(function() {
    $("#comment-input").val("")
    refreshComments()
  }).fail(popSorry).always(function() {
    $("#post-btn").prop('disabled', false);
  })
}

function popSorry() {
  // alert("Sorry, there was an error and your comment wasn't posted. Please try again.")
}
