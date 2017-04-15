check_categories = function(obj) {
  if($(obj).is(':checked')){
    var id = ($(obj).val());
    $.ajax({
      url: '/user_techniques/',
      type:'GET',
      data: {id: id},
      dataType: 'json',
      complete: function(xhr){
        var html_text = xhr.responseText;
        $(".technique-add-"+id).html(html_text);
      }
    })
  }
};
