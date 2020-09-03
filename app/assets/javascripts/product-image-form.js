$(document).on("turbolinks:load", function () {
  var append_input = $(
    `<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
  );
  $ul = $("#previews");
  $lis = $ul.find(".image-preview");
  $input = $ul.find(".input");
  if ($input.length == 0) {
    if ($lis.length <= 4) {
      $ul.append(append_input);
      $("#previews .input").css({
        width: `calc(100% - (20% * ${$lis.length}))`,
      });
    } else if ($lis.length == 5) {
      $ul.append(append_input);
      $("#previews .input").css({
        width: `100%`,
      });
    } else if ($lis.length <= 9) {
      $ul.append(append_input);
      $("#previews .input").css({
        width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
      });
    }
  }

  $(document).on("click", ".image_upload", function () {
    var preview = $(
      `<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div><div class="image-preview_btn_delete">削除</div></div>`
    );
    var append_input = $(
      `<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
    );
    $ul = $("#previews");
    $li = $(this).parents("li");
    $label = $(this).parents(".upload-label");
    $inputs = $ul.find(".image_upload");

    $(".image_upload").on("change", function (e) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function (e) {
        $(preview).find(".preview").attr("src", e.target.result);
      };

      $li.append(preview);
      $label.css("display", "none");
      $li.removeClass("input");
      $li.addClass("image-preview");
      $lis = $ul.find(".image-preview");

      $("#previews li").css({
        width: `114px`,
      });

      if ($lis.length <= 4) {
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * ${$lis.length}))`,
        });
      } else if ($lis.length == 5) {
        $li.addClass("image-preview");
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `100%`,
        });
      } else if ($lis.length <= 9) {
        $li.addClass("image-preview");
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
        });
      }

      $inputs.each(function (num, input) {
        $(input).removeAttr("name");
        $(input).attr({
          name: "product[images_attributes][" + num + "][name]",
          id: "product_images_attributes_" + num + "_name",
        });
      });
    });
  });
});
