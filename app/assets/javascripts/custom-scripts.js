$(document).ready(function(){
  // SCROLL REVEAL
  window.sr = new scrollReveal();


// UPVOTES
  $('.can_vote')
   .on('ajax:error', function () {
     $(this).after('<div>There was an upvote issue.</div>');
   }).on('ajax:success', function (res, data) {
     var $this = $(this);
     $this.find('.fa-caret-up').toggleClass('voted');
     $this.closest('.upvote').find('.upvote-count').text(data.vote_count);
   });

// COFFEEMEETS/EDIT
    $('#yes_irl').on('click', function(){
    $('#member_location').show();
  });
  $('#no_irl').on('click', function(){
    $('#member_location').hide();
  });

 // REMOVE COFFEES
  $('.remove-coffee').on('click', function() {
    $(this).remove();
    var coffee = this.id
    $('#'+ coffee).remove();
  }); 

// POSTS
   $('.dropdown').on('click', function(){
    $this = $(this)
    $this.toggleClass('open');
  });


  $('.toggle-description').on('click', function(){
    $this = $(this); // This is the "more" link
    $this.closest('.clean-post').find('.post-description').show();
    $this.remove();

  });

  // COMMENTS
    $('.toggle-reply').on('click', function(){
    $(this).closest('.clean-post').find('.reply-form:first').show()
    // toggle?
    $(this).hide()
  })
});