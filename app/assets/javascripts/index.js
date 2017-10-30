$(document).ready(function() {
  $('.extend-btn').on('click', function(event){
    $(this).find('.interior-card').slideToggle()
    $(this).find('.the-btn').toggle('hide')
    $(this).find('.the-btn .hide').toggle('hide')
  })
})
