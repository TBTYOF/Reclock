$(function() {
    $(document).on('click', 'input[name=edit_review]', function() {
    	// バリデーション
      if ($('#review_title').val() == '') {
      	alert('未入力の項目があります');
      	return false;
      }
      if ($('#review_body').val() == '') {
      	alert('未入力の項目があります');
      	return false;
      }
    })

    $(document).on('click', 'input[name = new_review]', function() {
    	// バリデーション
      if ($('#review_title').val() == '') {
      	alert('タイトルが未入力です。');
      	return false;
      }
      if ($('#review_body').val() == '') {
      	alert('本文が未入力です');
      	return false;
      }
    })

    $(document).on('click', 'input[name = new_inquiry]', function() {
    	// バリデーション
      if ($('#inquiry_title').val() == '') {
      	alert('未入力の項目があります');
        return false;
      }
      if ($('#inquiry_body').val() == '') {
      	alert('未入力の項目があります');
        return false;
      }
    })

    $(document).on('click', 'input[name = new_riply]', function() {
    	// バリデーション
      if ($('#reply_body').val() == '') {
      	alert('未入力の項目があります');
        return false;
      }
    })

  })