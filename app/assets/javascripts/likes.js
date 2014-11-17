$(document).ready(function() {

	$('.unlikes-link').hide();

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      $('.unlikes-link').toggle();
      $('.likes-link').toggle();

      var likeCount = $(this).siblings('.likes_count');

      $.post(this.href, function(response){
        likeCount.text(response.new_like_count);

    })
  })
})