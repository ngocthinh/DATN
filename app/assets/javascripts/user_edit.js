check_categories = function(obj) {
  if($(obj).is(':checked')){
    var id = ($(obj).val());
    $(".technique-add-"+id).html("<h1>#{id}</h1>")
  }
};
