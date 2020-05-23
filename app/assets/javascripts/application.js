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
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


// ヘッダーをページトップに固定
$(document).off().on('turbolinks:load', function() {
  let win = $(window);
  let header = $('.application__trackingHeader');
  let headerHeight = header.outerHeight();
  let startPos = 0;

  win.off().on('load scroll', function() {
    let value = $(this).scrollTop();
    if ( value > startPos && value > headerHeight ) {
      header.css('top', '-' + headerHeight + 'px');
    } else {
      header.css('top', '0');
    }
    startPos = value;
  });
});


// 指定したフォームが空欄または空文字を判定
function formCheck(identifier) {
  let regex = /\S/;
  let targetText = $(identifier).val();
  let judge = !!targetText && regex.test(targetText);
  if (!judge) alert("空欄または空白のみは無効です");
  return judge;
}

// 指定したフォームを空にする
const formClear = identifier => $(identifier).val("");

// 新規登録・ログインフォームのエラーウィンドウ操作
const closeErrorWindow = () => $("#error_explanation").fadeOut();
