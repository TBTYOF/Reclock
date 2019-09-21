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
//= require cocoon

// ハンバーガーメニュー
$(document).on('turbolinks:load', function(){
	$('.trigger').on('click', function(){
		$('.menu-trigger').toggleClass('active');

		if($('#sp-menu').hasClass('off')){
			$('#hm-icon').css('background-color', 'rgba(0,0,0,0)');
	    $('#sp-menu').removeClass('off');
	    $('#sp-menu').animate({'marginRight':'100%'},300).addClass('on');
	  }else{
	  	$('#hm-icon').css('background-color', '#fefefe');
	    $('#sp-menu').addClass('off');
	    $('#sp-menu').animate({'marginRight':'0px'},300);
	  }
		return false;
	});
});