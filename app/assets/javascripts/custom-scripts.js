$(function(){

  $('.can_vote')
   .on('ajax:error', function () {
     $(this).after('<div>There was an upvote issue.</div>');
   }).on('ajax:success', function (res, data) {
     var $this = $(this);
     $this.find('.fa-caret-up').toggleClass('voted');
     $this.closest('.upvote-post').find('.upvote-count').text(data.vote_count);
     console.log(data);
    //  $this.closest('.comment').find('.comment-upvote-count').text(data.vote_count)
     //var current_text = $this.text()
     //$this.text(data.voted_for ? "Unvote" : "Upvote")
   });
})            