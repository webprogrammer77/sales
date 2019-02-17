$(function () {

	var $body;
	$body = $('body');
	var inputTel = $('.phone-mask');

	$body
		.find('.phone-mask').each(function () {
			$(this).mask("+7 (999) 999-99-99", { autoclear: false });
		});

	$body.on('keyup', '.phone-mask', function () {
		var button = $('.form-sale__button');
		var phone = $(this),
			phoneVal = phone.val(),
			form = $(this).parents('form');
		var errMes = $('.er-phone');
		if ((phoneVal.indexOf("_") != -1) || phoneVal == '' ) {
			form.find(button).attr('disabled', true);
			errMes.fadeIn(200);
		} else {
			form.find(button).removeAttr('disabled');
		}
	});

});
