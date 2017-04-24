$(document).ready(function() {
  $('.techniques-of-category').on('click', function() {
     var category_id = this.dataset.id;
     var category_name = $('#category-name-' + category_id).text();
     $.ajax({
        url: '/admin/techniques/',
        type: 'GET',
        data: {id: category_id},
        dataType: "json",
        complete: function(xhr) {
          var html_text = xhr.responseText;
          $('#show-edit-user-form').html(html_text);
          $('#edit-user-modal').modal('show');
        }
      });
  });
  $('td').on('click', '.techniques-edit', function() {
    alert("dsf")
  });

  $('td').on('click', '.edit-category-user', function() {
    alert("dsf")
    });
  $('.edit-category').on('click', function() {
    var category_id = this.dataset.id;
    var category_name = $('#category-name-' + category_id).text();
    $('#category-name-' + category_id).html(`
       <input value="${category_name}" class="form-control"
       required="required" data-id="${category_id}" data-name="${category_name}"
       type="text" name="education_category[name]">
       <br>
       <button type="button" class="btn edit-category-user">save</button>
     `);
  });



});
