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
     $this.closest('.upvote-post').find('.upvote-count').text(data.vote_count);
   });

   $('.upvote')
   .on('ajax:error', function () {
     $(this).after('<div>There was an issue.</div>');
   }).on('ajax:success', function (res, data) {
     var $this = $(this)
     $this.closest('.post').find('.upvote-post').text(data.vote_count)
     var current_text = $this.text()
     $this.text(data.voted_for ? "Unvote" : "Upvote")
   });


// COFFEEMEETS/EDIT
    $('#yes_irl').on('click', function(){
    $('#member_location').show();
  });
  $('#no_irl').on('click', function(){
    $('#member_location').hide();
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
})            