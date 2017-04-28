$(document).ready(function() {
  $('#q_name_cont').on('keyup',function(e) {
    $.get($(this).attr('action'),
      $(this).serialize(), null, 'script');
    return false;
  });
});
