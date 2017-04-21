$(document).ready(function(){
  $(".disable-cancel img.raty-cancel").hide();

  $('#btn_category_edit').on('click', function(){
    var id = $(this).data('id');
    $.ajax({
      url: "/users/" + id +'/edit' ,
      type:'GET',
      dataType: 'json',
      complete: function(xhr){
        var html_text = xhr.responseText;
        $('#show-edit-user-form').html(html_text);
        $('#edit-user-modal').modal('show');
      }
    })
  })
});
