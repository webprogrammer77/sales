$(function () {

	// универсальная формула обработки форм
	var ajaxForm = function (form) {

		var url = form.attr('action'),
			data = form.serialize();

		return $.ajax({
			type: 'POST',
			url: url,
			data: data,
			dataType: 'JSON'
		});

	}

	// Обработка события

	var submitForm = function (ev) {
		ev.preventDefault();		

		var form = $(ev.target);

		var request = ajaxForm(form);

		request.done(function (msg) {
			var mes = msg.mes,
				status = msg.status;
			if (status === 'OK') {
				$('#popup-sale').hide(300);
				//удаление купленного товара из loccal storage
		var slMask = 'sal_';
		var showMask = 'show_';
		var productID = $('input[name="product_id"]').val(); //блок содержащий product_id
		/*localStorage.removeItem(slMask + productID);*/
		localStorage.setItem(showMask + productID, 'yes');
		localStorage.setItem(showMask, 'yes');
				
				$('#success').fadeIn(500);
				$(':input', '#sale-form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
				$('.er-phone').css('visibility', 'hidden');
				$('#phone').css('borderColor', 'green');
				
			} else if (status === 'erPhone'){
				$('.er-phone').css('visibility', 'visible');
				$('#phone').css('borderColor', 'red');
			
			} else {
				$('#phone').on('keyup', function(e){
					$('.er-phone').css('visibility', 'hidden');
					$('#phone').css('borderColor', 'rgb(0,0,0, 0.2)');
				})
				$('#error').fadeIn(500);
				$('.er-phone').css('visibility', 'hidden');
				$(':input', '#sale-form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
				$('#phone').css('borderColor', 'red');
			}
		});

		request.fail(function (jqXHR, textStatus) {
			$('#error').fadeIn(500);
			// alert("Request failed: " + textStatus);
		});
	}
		$('#phone').on('keyup', function (e) {
			$('.er-phone').css('visibility', 'hidden');
			$('#phone').css('borderColor', 'rgb(0,0,0, 0.2)');
		})
	$('#sale-form').on('submit', submitForm);


$(document).ready(function () {
	// $(selector).inputmask("99-9999999"); //static mask
	$('#phone').inputmask({	"mask": "+7(999) 999-99-99[9]"
	}); //specifying options
	// $(selector).inputmask("9-a{1,3}9{1,3}"); //mask with dynamic syntax
});


// var inp = $('#phone');
// if (inp.createTextRange) {
// 	var part = inp.createTextRange();
// 	part.move("character", 0);
// 	part.select();
// } else if (inp.setSelectionRange) {
// 	inp.setSelectionRange(0, 0);
// }
// inp.focus();

});