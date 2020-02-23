$(document).on('turbolinks:load', function(){
  var categoryBox = $('.form-details__form-box__category')

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
      .done(function(){
        
      })
    }
  })
})
