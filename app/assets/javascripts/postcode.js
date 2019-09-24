// 郵便番号から住所自動入力
$(document).on('turbolinks:load', function(){
  $('#postcode').jpostal({
    postcode : ['#postcode'],
    address  : {'#address' :'%3%4%5'}
  });
});

// 郵便番号入力後に住所フォーム出現
function countLength(postcode) {
	if(postcode.length >= 7){
	    $('.address-form').slideDown();
	  }else{
	    $('.address-form').slideUp();
	  }
}