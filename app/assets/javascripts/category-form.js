$(document).on('turbolinks:load', function(){
  var categoryBox = $('.form-details__form-box__category')
  // 親カテゴリー
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
  }

  
  categoryBox.on("change", "#parent-category", function(){
    var parentCategory = $("parent-category").value;
    if(parentCategory !== "") {
      $.ajax ({
        url: '/products/get_category_children',
        type: "GET",
        data: {
          parent_id: parentCategory
        },
        dataType: 'json'
      })
      .done(function(children){
        $('#child-category').remove();
        $('#grandchild-category').remove();
        var insertHTML = '';
        children.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
    }
  })
})
