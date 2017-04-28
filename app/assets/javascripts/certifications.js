$(document).ready(function() {
  $('td').on('click', '.edit-certification', function() {
     var certification_id = this.dataset.id;
     $.ajax({
        url: '/admin/certifications/'+certification_id+'/edit',
        type: 'GET',
        dataType: "json",
        complete: function(xhr){
        var html_text = xhr.responseText;
        $('#show-edit-certification-form').html(html_text);
        $('#edit-certification-modal').modal('show');
      }
      });
  });
});
