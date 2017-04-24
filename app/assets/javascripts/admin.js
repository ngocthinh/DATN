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
          $('#techniques-all-'+category_id).html(html_text);
        }
      });
  });
  $('td').on('click', '.techniques-edit', function() {
    alert("dsf")
  });

  $('td').on('click', '.edit-category-user', function() {
     var category_id = $(this).attr('value');
     var category_name = $('.input-category-name-'+category_id).val();

     $.ajax({
         type: 'patch',
         url: '/admin/categories/' + category_id,
         data: {category: {name: category_name}},
         success: function(data){
           if(data.status === 200) {
             $.growl.notice({title: '', message: data.flash});
             $('#category-name-' + category_id).html("<label>" + data.name + "</label>");
           }
           else {
             $.growl.error({title: '', message: data.flash});
             location.reload();
           }
         },
         error: function(error) {
           $.growl.error({title: '', message: error});
           location.reload();
         }
       });
  });
  $('.edit-category').on('click', function() {
    var category_id = this.dataset.id;
    var category_name = $('#category-name-' + category_id).find('label').text();
    $('#category-name-' + category_id).html(`
       <label style="display:none">${category_name}</label>
       <input value="${category_name}" class="form-control input-category-name-${category_id}"
       required="required" data-id="${category_id}" data-name="${category_name}"
       type="text" >
       <br>
       <button type="button" class="btn edit-category-user" value ="${category_id}">save</button>
     `);
  });
  $('td').on('click', '.techniques-add', function() {
    var category_id = this.dataset.id;
    $('#add-technique-' + category_id).html(`
       <input class="form-control input-new-technique-${category_id}">
       <br>
       <button type="button" class="btn button-new-technique" value ="${category_id}">save</button>
     `);

  });


  $('td').on('click', '.button-new-technique', function() {
      var category_id = $(this).attr('value');
      var technique_name = $('.input-new-technique-'+category_id).val();
      $.ajax({
          type: 'POST',
         url: '/admin/techniques/',
         data: {category_id: category_id, technique_name: technique_name},
         complete: function(xhr) {
          var html_text = xhr.responseText;
          $('#techniques-all-'+category_id).html(html_text);
        }
     });
  });
});
