$(document).on('turbolinks:load', function() {
  $('.jscroll').jscroll({
    loadingHtml: '読み込み中',
    contentSelector: '.jscroll',
    nextSelector: 'a.next'
  });
});