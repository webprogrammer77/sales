jQuery.noConflict();

jQuery(document).ready(function (jQuery) {

	/* универсальная формула обработки форм*/
	var ajaxForm = function(form) {

		var url = form.attr('action'),
			data = form.serialize();

		return jQuery.ajax({
			type: 'POST',
			url: url,
			data: data,
			dataType: 'JSON'
		});

	}

	/* Обработка события*/

	var submitForm = function (ev) {
		ev.preventDefault();		

		var form = jQuery(ev.target);

		var request = ajaxForm(form);

		request.done(function (msg) {
			var mes = msg.mes,
				status = msg.status;
			if (status === 'OK') {
				jQuery('#popup-sale').hide(300);
				/* удаление из local storage купленного товара*/
		var slMask = 'sall_';
		var productID = jQuery('input[name="product_id"]').val(); /*блок содержащий product_id*/
		localStorage.removeItem(slMask + productID);
				
				jQuery('#success').fadeIn(500);
				jQuery(':input', '#sale-form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
				jQuery('.er-phone').css('visibility', 'hidden');
				jQuery('#phone').css('borderColor', 'green');
				
			} else if (status === 'erPhone'){
				jQuery('.er-phone').css('visibility', 'visible');
				jQuery('#phone').css('borderColor', 'red');
			
			} else {
				jQuery('#phone').on('keyup', function(e){
					jQuery('.er-phone').css('visibility', 'hidden');
					jQuery('#phone').css('borderColor', 'rgb(0,0,0, 0.2)');
				})
				jQuery('#error').fadeIn(500);
				jQuery('.er-phone').css('visibility', 'hidden');
				jQuery(':input', '#sale-form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
				jQuery('#phone').css('borderColor', 'red');
			}
		});

		request.fail(function (jqXHR, textStatus) {
			jQuery('#error').fadeIn(500);
			/* alert("Request failed: " + textStatus);*/
		});
	}
		jQuery('#phone').on('keyup', function (e) {
			jQuery('.er-phone').css('visibility', 'hidden');
			jQuery('#phone').css('borderColor', 'rgb(0,0,0, 0.2)');
		})
	jQuery('#sale-form').on('submit', submitForm);


jQuery(document).ready(function () {
	/* jQuery(selector).inputmask("99-9999999");*/ /*static mask*/
	jQuery('#phone').inputmask({	"mask": "+7(999) 999-99-99[9]"
	}); /*specifying options*/
	/* jQuery(selector).inputmask("9-a{1,3}9{1,3}");*/ /*mask with dynamic syntax*/
});


/* var inp = jQuery('#phone');
 if (inp.createTextRange) {
 	var part = inp.createTextRange();
	part.move("character", 0);
 	part.select();
 } else if (inp.setSelectionRange) {
 	inp.setSelectionRange(0, 0);
}
inp.focus();
*/
});