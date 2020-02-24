$(document).on('turbolinks:load', function(){
  // カテゴリーの選択肢が入ったdiv
  var categoryBox = $('.form-details__form-box__category')
  // 親カテゴリー
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
  }
  
  // 子カテゴリー
  function appendChildBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `<div class='form-select' id="child-category">
                        <select class= 'select-default' name="product[category_ids][]">
                            <option value>---</option>
                            ${insertHTML}
                          </select>
                          <i class='fa fa-angle-down icon-angle-down'></i>
                      </div>`
    categoryBox.append(childSelectHtml);
  }

  // カテゴリーボックスで親カテゴリが変わった場合
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
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      //親カテゴリーが初期値（---)の場合、子カテゴリー以下は非表示にする
      $('#child-category').remove(); 
      $('#grandchild-category').remove();
      $('#size').remove();
    }
  });
});
