// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  var button_delete = document.querySelector('.delete')
  if (!button_delete) return;
  button_delete.addEventListener('click', function (event) {
    var _this = this
    _this.parentNode.classList.add('is-hidden')
  })
  setTimeout(function () {
    button_delete.click()
  }, 2500)
});

$(document).on('turbolinks:load', function() {
  $('.file-image').change(function(){
    $('.image-preview-field').html("");
    for (var i = 0; i < $('input[type="file"]').prop('files').length; i++) {
      var fileReader = new FileReader();
      fileReader.onload = function(e) {
        var html = `<img src="${e.target.result}" width="120" height="120" style="margin-left: 5px;">`
        $('.image-preview-field').append(html);
      }
      fileReader.readAsDataURL($('input[type="file"]').prop('files')[i]);
    }
  });
});