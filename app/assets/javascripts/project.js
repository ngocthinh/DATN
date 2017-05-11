$(document).ready(function() {
  $('#q_name_cont').on('keyup',function(e) {
    var category_id = $('.category-project').val();
    var search = $(".form-search-project").val()
    var data = {category_id: category_id, q: {name_cont: search}}
    $.get($(this).attr('action'),
      data, null, 'script');
    return false;
  });

  $('.category-project').on('change',function(e) {
    var category_id = $('.category-project').val();
    var data = {category_id: category_id}
    $.get($(this).attr('action'), data , null, 'script');
    return false;
  });
});
