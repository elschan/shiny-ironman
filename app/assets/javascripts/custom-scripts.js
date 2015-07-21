$(function(){
  
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

// location/irl
    $('#yes_irl').on('click', function(){
    $('#member_location').show();
  });
  $('#no_irl').on('click', function(){
    $('#member_location').hide();
  });

// coffeemeets
$('.reply-to').on('click', function() {
  var showForm = this.id;
  var newId = '#accept-form-'+ showForm;
  $('.accepting').hide();
  $(newId).show();
 
});

$('.confirm-to').on('click', function() {
  var showConfirm = this.id;
  var confirmId = '#confirm-form-' + showConfirm;
  $('.confirming').hide();
  $(confirmId).show();
  
});




// POSTS
   $('.dropdown').on('click', function(){
    $this = $(this)
    $this.toggleClass('open');
  });


  $('.toggle-description').on('click', function(){
    $this = $(this);
    $this.closest('.post').find('.post-description').show();
    $this.remove();

  });

  // COMMENTS
    $('.toggle-reply').on('click', function(){
    $(this).closest('.post').find('.reply-form:first').show()
    // toggle?
    $(this).hide()
  })
})            