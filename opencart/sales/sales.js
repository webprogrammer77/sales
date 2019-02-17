//jQuery.noConflict();
$(function () {

	/*--переменные--*/
	var slMask = 'sal_';
	console.log('slMask: ' + slMask);
	/*путь до папки с изображениями*/
	var pathImage = 'https://' + window.location.host + '/image/data/products/';
	console.log('pathImage: ' + pathImage);
	/*блок содержащий product_id*/
	var productID = $('input[name="product_id"]').val(); /*блок содержащий product_id*/
	console.log('productID: ' + productID);
	var skuPrefix = 1100000;
	console.log('skuPrefix: ' + skuPrefix);
	var skuPage = $('.product-info h5 strong').text().trim();
	/*var skuPage = $('input[name="product_sku"]').val();*/
	console.log('skuPage: ' + skuPage);
	var sku = parseInt(productID) + skuPrefix;
	console.log('sku: ' + sku);
	var quant = 1;
	console.log('quant: ' + quant);
	var buttonOrder = $('#button-cart').val('Купить'); // кнопка купить	open cart
	console.log('buttonOrder: есть кнопка ' + buttonOrder.val());
	//var buttonOrder = $('.addtocart_button').val('Купить'); // кнопка купить joomla
	var buttonOneClick = $('a:contains("Купить в один клик")'); // кнопки купить в один клик
	console.log('buttonOneClick: есть кнопка ' + buttonOneClick.text());
	var noSale = 'offer';
	var popupSale = $('#popup-sale');
	var saleButton = $('#sale-button');
	var itemsLs = $('.popup-sale__items').length;
	var slider = $('#elements', popupSale);
	var listitems = slider.children('.popup-sale__items').get();
	var popupSaleClose = $('#popup-sale__close');

	var winW = $(window).width();
	var winH = $(window).height();
	
	/*==========перезагрузка страницы =================*/
	/*---функция распознавания GET запроса из URL---*/
	var getUrlParameter = function getUrlParameter(sParam) {
		var sPageURL = decodeURIComponent(window.location.search.substring(1)),
			sURLVariables = sPageURL.split('&'),
			sParameterName,
			i;
		for (i = 0; i < sURLVariables.length; i++) {
			sParameterName = sURLVariables[i].split('=');
			if (sParameterName[0] === sParam) {
				return sParameterName[1] === undefined ? true : sParameterName[1];
			}
		}
	}
	//var cartUrl = getUrlParameter('page');/*joomla  shop.cart*/
	var cartUrl = getUrlParameter('route'); /*openCart checkout/cart && quickcheckout/checkout*/	
	var cartUrll = window.location.pathname.toString();/*openCart '/cart/'*/
	console.log('cartUrl: ' + cartUrl);
	console.log('window.location.pathname: ' + window.location.pathname);
	console.log('window.location.href: ' + window.location.href);
	
	/*----------------------------------------------*/	

	
	/*----------Проверка скидки------------------*/
	var chekSale =  function(productID) {
			var value = "noconnect";
			if (productID == undefined) {
				console.log('productID не найден или это не страница товара');
				return;
			}
			console.log('productID before: ' + productID);
			console.log('value before: ' + value);
		$.ajax({
					url: '/sales/sale.php',					
					type: 'POST',
					dataType: 'json',
					async :false,
					data: {
						productID: productID
					},
					success: function (json) {
						console.log('json.status: ' + json.status);
						value = json.status;
					},
					error: function (){}
				});
			return value;
	}
	var saleOk = chekSale(productID);
	console.log('saleOk: ' + saleOk);
	/*----------/Проверка скидки------------------*/
	
	/*-------------------Установки ROISTAT--------------------------*/
/*---------настроен в футере---------------------*/	
/*
function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

var roistatIdLs = localStorage.getItem('roistat_first_visit');
console.log('roistatIdLs: ' + roistatIdLs);

setTimeout(function () {
	var getRoistatVizit = setInterval(function() {
		var roistat_id = roistat.getVisit();
		console.log('roistat_id: ' + roistat_id);
		console.log('input roistat_visit value:  ' + document.querySelector('.form-sale .roistat_visit').value);
	}, 100);

	setTimeout(function () {
		
		  clearInterval(getRoistatVizit); 		
		
	}, 7777);
}, 333);
	
	
	//var roistatId1 = "<?php echo array_key_exists('roistat_visit', $_COOKIE) ? $_COOKIE['roistat_visit'] : "неизвестно";  ?>";	

var getRoistatId = setInterval(function() {
	
	var roistatId = getCookie('roistat_visit');
	var roistat_id = roistat.getVisit();
	var roistatInput = 	document.querySelector('.form-sale .roistat_visit');
		if(roistatId !== undefined || roistatId !== '' || roistatId !== null){
			roistatInput.value = roistatId;
		}else{
			if(roistat_id !== undefined || roistat_id !== '' || roistat_id !== null){
				roistatInput.value = roistat_id;
			}else{
				roistatInput.value = 'неизвестно';
			}
		}
	
}, 333);

setTimeout(function () {
	
	  clearInterval(getRoistatId); 		
	
}, 7777);
*/
/*------------------------/Установки ROISTAT--------------------------------------*/
	//$(window).load(function(){
	if(cartUrl != 'checkout/cart'){ 
	if(cartUrl != 'quickcheckout/checkout'){
	if(cartUrll != '/cart/'){
	//if (cartUrl != 'quickcheckout/checkout') {
		var showMask = 'show_';
		if (localStorage.getItem(showMask + productID) != undefined) {
			localStorage.removeItem(showMask + productID);
		}

		if (productID != undefined) {
			var dateNew = new Date();
			addLs(productID, pathImage, skuPrefix, quant, slMask, dateNew);
		}
		var lsLen = localStorage.length;
		if (lsLen > 0) {
			for (var i = 0; i < lsLen; i++) {
				key = localStorage.key(i);

				//if (key.indexOf(slMask) == 0 && localStorage.getItem(key) != 'offer' && localStorage.getItem(key) !== 'undefined') {
				if (key.indexOf(slMask) == 0 && localStorage.getItem(key) != 'offer') {

					var value = JSON.parse(localStorage.getItem(key));
					productIdLs = value.id;
					dateLs = value.dateView;
					if (productID == productIdLs) {
						var dateLs = new Date();
						var productID = productID;
					} else {
						var dateLs = dateLs;
						var productID = productIdLs;
					}
					console.log('productIdLs' + i + '= ' + productIdLs);
					console.log('dateLs' + i + '= ' + dateLs);
					addLs(productID, pathImage, skuPrefix, quant, slMask, dateLs);

				}
			}
		}
		//if (cartUrl != 'checkout/cart') {
		setTimeout(function () {
			var showMask = 'show_';
			var show = localStorage.getItem(showMask + productID);
			addHtml();
			if (popupSale.css('display') != 'block' && show != 'yes') {
				showSales();
			}
		}, 300);
		//}
	}
	}
	}

	/*==============================================================*/
	/*==========клик по кнопке saleButton ==================*/

	saleButton.on('click', function (e) {
		e.preventDefault();
		e.stopPropagation();
		var key, value;
		var lsLen = localStorage.length;
		var slMask = 'sal_';
		var countMask = 'countShow_';
		var countShow = parseInt(localStorage.getItem(countMask + productID));
		console.log('countShow: ' + countShow);

		$('#elements').children('.popup-sale__items').remove();

		for (var i = 0; i < lsLen; i++) {
			key = localStorage.key(i); //получаем ключ записи	
			if (key.indexOf(slMask) == 0 && localStorage.getItem(key) != 'offer' && localStorage.getItem(key) !== 'undefined') {
				var value = JSON.parse(localStorage.getItem(key));
				productIdLs = value.id;
				dateLs = value.dateView;
				if (productID == productIdLs) {
					var dateLs = new Date();
					var productID = productID;
				} else {
					var dateLs = dateLs;
					var productID = productIdLs;
				}
				console.log('productIdLs' + i + '= ' + productIdLs);
				addLs(productIdLs, pathImage, skuPrefix, quant, slMask, dateLs);
			}
		}

		var popupSale = $('#popup-sale');
		var slider = $('#elements');
		var listitems = slider.children('.popup-sale__items').get();

		setTimeout(function () {
			var itemsLen = $('.popup-sale__items').length;
			if (itemsLen == 0 ){
			addHtml();
			}

		}, 300);
		// setTimeout(function () {
		// 	var itemsLs = $('.popup-sale__items').length;
		// 	var slider = $('#elements');
		// 	slickShow(itemsLs, slider);
		// }, 300);

		/*----------------------------------------------------------------------*/
		popupSale.fadeIn(300);
		//popupSale.addClass('active');
		$(this).fadeOut(300);
		sortItems(listitems, slider);

		setTimeout(function () {
			var itemsLs = $('.popup-sale__items').length;
			if (itemsLs > 3) {
				slickShow(itemsLs, slider);
			} else if (itemsLs > 2 && winW <= 768) {
				slickShow(itemsLs, slider);
			} else if (itemsLs > 1 && winW <= 480) {
				slickShow(itemsLs, slider);
			}
		}, 300);
		/*----------------------------------------------------------------------*/


	});
	/*==============================================================*/
	/* ====  удаление из localstorage ====*/
	//var productID = $('input[name="product_id"]').val();

	/*кликнули по кнопке купить	*/			
	buttonOrder.click(function (e) {
		deleteLs(slMask, noSale, saleItems, popupSale, saleButton);
		//var productID = $('input[name="product_id"]').val();	
		var showMask = 'show_';		
		localStorage.setItem(showMask + productID, 'yes');
		if (saleButton.css('display') == 'block') {
			saleButton.fadeOut(100);
		}
	});

	/* кликнули по кнопке купить в один клик*/
	buttonOneClick.click(function (e) {
		deleteLs(slMask, noSale, saleItems, popupSale, saleButton);
		//var productID = $('input[name="product_id"]').val();	
		var showMask = 'show_';		
		localStorage.setItem(showMask + productID, 'yes');
		if (saleButton.css('display') == 'block') {
			saleButton.fadeOut(100);
		}
	});
	/*==============================================================*/
	/*====== отправка заказа через форму и добавления в купленные товары ====*/

	var saleItems = $('#elements .popup-sale__items'); // все item
	//var inputPhone = $('#phone');
	$('body').on('click', '.popup-sale__items', function (e) {
		e.preventDefault();
		var $this = $(e.currentTarget),
			container = $this.closest('#elements'),
			saleItems = $('#elements .popup-sale__items');

		if (saleItems.length != 0 && !$this.hasClass('cur-sale')) {
			saleItems.removeClass('cur-sale');
			$this.addClass('cur-sale');
			
			var valSKU = $this.attr('data-sku');
			var valID = $this.attr('data-id');
			var valName = $this.attr('data-name');
			var valPrice = $this.attr('data-price');
			var valSale = $this.attr('data-sale');
			var valURL = window.location.host;

			var saleForm = $('#sale-form');

			var inputName = $('.sale-name-hide', saleForm);
			var inputID = $('.sale-id-hide', saleForm);
			var inputURL = $('.sale-url-hide', saleForm);
			var inputSKU = $('.sale-sku-hide', saleForm);
			var inputPrice = $('.sale-price-hide', saleForm);
			var inputSale = $('.sale-sale-hide', saleForm);

			inputSKU.val(valSKU);
			inputURL.val(valURL);
			inputID.val(valID);
			inputName.val(valName);
			inputPrice.val(valPrice);
			inputSale.val(valSale);

		} else {

			//$this.addClass('cur-sale');
		}

	});

	var inputPhone = $('#phone');
	inputPhone.on('focus',  function () {
		var saleItems = $('#elements').find('.popup-sale__items'); // все item
		var itemsCurrent = $('.popup-sale__items.cur-sale'); // current		
			//var firstSaleItems = saleItems.first();
			
			var valSKU = itemsCurrent.attr('data-sku');
			var valID = itemsCurrent.attr('data-id');
			var valPrice = itemsCurrent.attr('data-price');
			var valSale = itemsCurrent.attr('data-sale');
			var valName = itemsCurrent.attr('data-name');			
			var valURL = window.location.host;
		
			var saleForm = $('#sale-form');

		var inputName = $('.sale-name-hide', saleForm);
		var inputID = $('.sale-id-hide', saleForm);
		var inputURL = $('.sale-url-hide', saleForm);
		var inputSKU = $('.sale-sku-hide', saleForm);
		var inputPrice = $('.sale-price-hide', saleForm);
		var inputSale = $('.sale-sale-hide', saleForm);

		inputName.val(valName);
		inputID.val(valID);
		inputURL.val(valURL);
		inputSKU.val(valSKU);
		inputPrice.val(valPrice);
		inputSale.val(valSale);

	})

	/*==== настройка показа скидок по времени задержки и появлению кнопки вместо окна в зависимости от количества просмотренных скидок ===*/

	/*------------------показ скидки перед уходом со страницы--------------*/

	/* функция возвращает cookie с именем name, если есть, если нет, то undefined --*/

	function getCookie(name) {
		var matches = document.cookie.match(new RegExp(
			"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
		));
		return matches ? decodeURIComponent(matches[1]) : undefined;
	}
	// проверяем, есть ли у нас cookie, с которой мы не показываем окно и если нет, запускаем показ
	/*
	var alertwin = getCookie("alertwin");
	if (alertwin != "no") { 
	    $(document).mouseleave(function(e){
	        if (e.clientY < 0) {
	            $(".popup-sale").fadeIn("fast");    
	            //записываем cookie на 1 день, с которой мы не показываем окно
	            var date = new Date;
	            date.setDate(date.getDate() + 1);    
	            document.cookie = "alertwin=no; path=/; expires=" + date.toUTCString();       
	        }    
	    });
		
	}
	*/
	/*-----------------------------------------------------------------*/
	/*---используем local storage дл показа скидок только при первом выходе---*/
	var slMask = 'sal_';
	var showMask = 'show_';
	var productID = $('input[name="product_id"]').val();
	var alertwin = localStorage.getItem(showMask + productID);
	var alertStop = localStorage.getItem(showMask);
	var popupSale = $(".popup-sale");
	//if (alertwin == undefined && alertwin != 'yes') { 
	$(document).mouseleave(function (e) {
		var slMask = 'sal_';
		var alertwin = localStorage.getItem(showMask + productID);
		var itemsLs = $('.popup-sale__items', slider).length;
		if (e.clientY < 0 && alertwin != 'yes' && alertStop != 'yes' && productID != undefined && itemsLs > 0) { /*-----можно заменить проверку productID на cartURL-----*/
			$('#elements').children('.popup-sale__items').remove();
			//	if (lsLen > 0) {
			for (var i = 0; i < lsLen; i++) {
				key = localStorage.key(i); //получаем ключ записи			

				if (key.indexOf(slMask) == 0 && localStorage.getItem(key) != 'offer' && localStorage.getItem(key) !== 'undefined') {
					var value = JSON.parse(localStorage.getItem(key));
					productIdLs = value.id;
					console.log('productIdLs' + i + '= ' + productIdLs);
					addLs(productIdLs, pathImage, skuPrefix, quant, slMask);
				}


			}
			addHtml();
			if (popupSale.css('display') == 'none') {
				popupSale.fadeIn(200);
				if (saleButton.css('display') == 'block') {
					saleButton.fadeOut(100);
				}
				localStorage.setItem(showMask + productID, 'yes');
				localStorage.setItem(showMask, 'yes');
			}
		}
	});

	//}
	console.log('alertwin :' + alertwin);
	//console.log(' :' + );
	//console.log(' :' + );
	/*------------------------------------------------------------------*/
	/* ================== popups ======================================*/

	var statusPopupClose = $(".status-popup__close");
	var statusPopup = $('.status-popup');
	statusPopupClose.click(function (e) {
		e.preventDefault();
		statusPopup.fadeOut(300);
	});

	var policeOpen = $(".police__open");
	var police = $(".police");
	policeOpen.click(function (e) {
		e.preventDefault();
		$(".police").fadeIn(300);
	});
	var policeClose = $(".police__close");
	var police = $(".police");
	policeClose.click(function (e) {
		e.preventDefault();
		$(".police").fadeOut(300);
	});
	/*==================================================================*/
	/*=========finish===================================================*/
});

function addLs(productID, pathImage, skuPrefix, quant, slMask, dateLs) {
	$.ajax({
		url: './sales/sale.php',
		type: 'POST',
		dataType: 'json',
		data: {
			productID: productID
		},
		success: function (json) {
			if (json.status === "OK") {
				var saleA = json.mesA;
				var saleB = json.mesB;
				var productPrice = json.mesC;
				var productName = json.mesD;
				var productImage = json.mesE;

				var productImage = pathImage + productImage;
				var saleA = parseInt(saleA);
				var saleB = parseInt(saleB);
				var productPrice = parseFloat(productPrice);
				var newPriceA = productPrice * (1 - saleA / 100);
				var newPriceA = parseInt(newPriceA);
				var newPriceB = productPrice * (1 - saleB / 100);
				var newPriceB = parseInt(newPriceB);
				var sku = parseInt(productID) + skuPrefix;
				var viewItem = {
					id: productID,
					sku: sku,
					quant: quant,
					name: productName,
					img: productImage,
					oldPrice: productPrice,
					newPriceA: newPriceA,
					newPriceB: newPriceB,
					saleA: saleA,
					saleB: saleB,
					dateView: dateLs
				};
				/* сохраняем, просматриваемый в данный момент пользователем товар в хранилище*/
				if (localStorage.getItem(slMask + productID) !== 'offer' && saleA !== 'undefined' && saleB !== 'undefined' && productID != undefined) {
					localStorage.setItem(slMask + productID, JSON.stringify(viewItem));
				}
			}
		}
	});
}

/*=*=*=*=*= БЛОК ФУНКЦИЙ *=*=*=*=*=*/

/* === функция удаления данных при клике на кнопки купить ========*/

function deleteLs(slMask, noSale, saleItems, popupSale, saleButton) {
	var productID = $('input[name="product_id"]').val();
	var saleItems = $('.popup-sale__items');
	localStorage.removeItem(slMask + productID);
	localStorage.setItem(slMask + productID, noSale);
	$('#elements').find('[data-sale="' + productID + '"]').remove();
	$('#popup-sale').fadeOut();
	if (saleItems.lenght == 1) {
		popupSale.addclass('one-items');
	}
	if (saleButton.css('display') == 'block') {
		saleButton.fadeOut(100);
	}
}

/* ==== функция показа скидок addHtml() ==== */

function addHtml() {
	var key, value;
	var lsLen = localStorage.length;
	var slMask = 'sal_';

	if (lsLen > 0) { //проверяем есть ли значения в localstorage		

		for (var i = 0; i < localStorage.length; i++) { // перебираем все данные в хранилище

			key = localStorage.key(i); //получаем ключ записи			

			if (key.indexOf(slMask) == 0 && localStorage.getItem(key) != 'offer' && localStorage.getItem(key) !== 'undefined') {
				var value = JSON.parse(localStorage.getItem(key));

				//получаем по ключу объект
				var sku = value.sku; //название 
				var nameSale = value.name; //название 
				var oldprice = value.oldPrice; //цена без скидки
				var newpriceA = value.newPriceA; //цена со скидкой
				var newpriceB = value.newPriceB; //цена со скидкой
				var saleA = value.saleA; //процент скидка
				var saleB = value.saleB; //процент скидка
				var imgSale = value.img; //путь до картинки
				var id = value.id; //product_id
				var dateView = value.dateView; //дата просмотра			
				var date = Date.parse(dateView);
				var countLs = value.countLs;
				var countMask = 'countShow_';
				var countShow = parseInt(localStorage.getItem(countMask + id));
				var countShowTime = parseInt(localStorage.getItem(countMask));
				if (countShow >= 1) {
					var sale = parseInt(saleB);
					var newprice = parseInt(newpriceB);
				} else {
					var sale = parseInt(saleA);
					var newprice = parseInt(newpriceA);
				}

				/*ограничение скидки*/
				if (sale >= 40) {
					var sale = 40;
				}



				// карточка товара		
				var saleHTML = '<div  class="popup-sale__items" data-price ="' + newprice + '" data-sale ="' + sale + '" data-view ="' + date + '" data-id="' + id + '" data-sku="' + sku + '" data-name="' + nameSale + '"><div class="popup-sale__pic"><img class="popup-sale__img" src="' +
					imgSale + '" alt="Изображение товара"></div><div class="popup-sale__descrip"><div class = "popup-sale__name"> ' +
					nameSale + '</div><div class="popup-sale__sale">скидка: <span class = "popup-sale__sale-num"> ' +
					sale + '%</span></div><div class="popup-sale__old-price">Цена: <span class="popup-sale__old-price-num" >' +
					oldprice + 'р.</span></div><div class="popup-sale__new-price"> Ваша цена: <span class="popup-sale__new-price-num"> ' +
					newprice + 'р.</span></div></div></div>';

				$('#elements').prepend( //помещаем карточку товара в элемент слайдера
					saleHTML
				);
				
				if (Date.parse(value.dateView) < (new Date() - 1000 * 60 * 60 * 24 * 14)) {
					localStorage.removeItem(key);
				}

			}
		}

		// var itemsLs = $('.popup-sale__items').length;		
		// var slider = $('#elements', popupSale);
		// var productID = $('input[name="product_id"]').val();

		var popupSale = $('#popup-sale');
		var slider = $('#elements', popupSale);
		var listitems = slider.children('.popup-sale__items').get();

		// var popupSale = $('#popup-sale');
		// var saleButton = $('#sale-button');
		/* -------- сортировка ------------------------------------------*/
		sortItems(listitems, slider);
		/*--------ограничение по количеству показываемых скидок----------*/
		var product__id = $('input[name="product_id"]').val();
		if(product__id != undefined){
			slider.children('.popup-sale__items').not('[data-id="' + product__id + '"]').remove();
		}else{
			slider.children('.popup-sale__items:gt(9)').remove();
		}
		/*---------------------------------------------------------------*/
		$('#elements').find(".popup-sale__items").filter( ':first' ).addClass('cur-sale');
		//var itemsCurrent = $('.popup-sale__items.cur-sale'); // current		
		//var firstSaleItems = saleItems.first();
		var itemsCurrent = $('#elements').find(".popup-sale__items").filter(':first');
		var valSKU = itemsCurrent.attr('data-sku');
		var valID = itemsCurrent.attr('data-id');
		var valPrice = itemsCurrent.attr('data-price');
		var valSale = itemsCurrent.attr('data-sale');
		var valName = itemsCurrent.attr('data-name');
		var valURL = window.location.host;

		var saleForm = $('#sale-form');

		var inputName = $('.sale-name-hide', saleForm);
		var inputID = $('.sale-id-hide', saleForm);
		var inputURL = $('.sale-url-hide', saleForm);
		var inputSKU = $('.sale-sku-hide', saleForm);
		var inputPrice = $('.sale-price-hide', saleForm);
		var inputSale = $('.sale-sale-hide', saleForm);

		inputName.val(valName);
		inputID.val(valID);
		inputURL.val(valURL);
		inputSKU.val(valSKU);
		inputPrice.val(valPrice);
		inputSale.val(valSale);
	}
}

function sortItems(listitems, mylist) {
	listitems.sort(function (a, b) {
		var distA = parseInt($(a).attr('data-view'));
		var distB = parseInt($(b).attr('data-view'));
		return (distA < distB) ? -1 : (distA > distB) ? 1 : 0;
	});
	$.each(listitems, function (idx, itm) {
		mylist.prepend(itm);
	});
}


/*==========функция показа скидок================*/

function showSales() {
	var showMask = 'show_';
	var show = localStorage.getItem(showMask + productID);
	var productID = $('input[name="product_id"]').val();
	var popupSale = $('#popup-sale');
	var slider = $('#elements', popupSale);
	var itemsLs = $('.popup-sale__items', slider).length;
	var listitems = slider.children('.popup-sale__items').get();
	var saleButton = $('#sale-button');
	var winW = $(window).width();
	var winH = $(window).height();
	var countMask = 'countShow_';
	var countShowTime = parseInt(localStorage.getItem(countMask));
	if (countShowTime == 2) {
		pauseTime = 15000;
	} else if (countShowTime == 1) {
		pauseTime = 12000;
	} else {
		pauseTime = 10000;
	}
	console.log('show = ' + show);
	console.log('pauseTime = ' + pauseTime);

	if (itemsLs == 1) {
		slider.addClass('one-items');
		saleButton.delay(300).fadeIn(300);
		if (productID != undefined) { //показ на любой странице
			setTimeout(function () {
				var show = localStorage.getItem(showMask + productID);
				console.log('show1 = ' + show);
				if (show != 'yes') {
					popupSale.fadeIn(300);
					saleButton.fadeOut(300);
				}
			}, pauseTime);
		}
	} else if (itemsLs == 2) {
		slider.removeClass('one-items');
		saleButton.delay(300).fadeIn(300);
		if (productID != undefined) { //показ на любой странице
			setTimeout(function () {
				var show = localStorage.getItem(showMask + productID);
				if (show != 'yes') {
					popupSale.fadeIn(300);
					saleButton.fadeOut(300);
				}
				if (winW <= 480) {
					slickShow(itemsLs, slider);
				}
			}, pauseTime);
		}

	} else if (itemsLs == 3) {
		slider.removeClass('one-items');
		saleButton.delay(100).fadeIn(300);
		if (productID != undefined) { //показ на любой странице

			setTimeout(function () {
				var show = localStorage.getItem(showMask + productID);
				if (show != 'yes') {
					popupSale.fadeIn(300);
					saleButton.fadeOut(300);
				}
				if (winW <= 768) {
					slickShow(itemsLs, slider);
				}
			}, pauseTime);
		}
	} else if (itemsLs > 3) {
		slider.removeClass('one-items');
		saleButton.delay(1000).fadeIn(300);

	}

	var popupSaleClose = $('#popup-sale__close');

	popupSaleClose.click(function (e) {
		e.preventDefault();
		e.stopPropagation();
		var countMask = 'countShow_';
		var showMask = 'show_';
		var countShow = parseInt(localStorage.getItem(countMask + productID));
		var countShowTime = parseInt(localStorage.getItem(countMask));
		var show = localStorage.getItem(showMask + productID);
		console.log('show2 = ' + show);
		console.log('countShow: ' + countShow);
		if (!countShow) {
			countShow = 1;
			localStorage.setItem(countMask + productID, 1);
			countShowTime = 1;
			localStorage.setItem(countMask, 1);
		} else {
			countShow = 2;
			localStorage.setItem(countMask + productID, 2);
			countShowTime = 2;
			localStorage.setItem(countMask, 2);
		};
		popupSale.fadeOut(300);
		saleButton.fadeIn(300);
		localStorage.setItem(showMask + productID, 'yes'); /*чтобы не показывать окно если оно уже показано*/
		if (itemsLs > 3) {
			slider.slick('unslick');
		} else if (itemsLs > 2 && winW <= 768) {
			slider.slick('unslick');
		} else if (itemsLs > 1 && winW <= 480) {
			slider.slick('unslick');
		}
	});

}

/*===============================================*/


var slider = $('#elements');

function slickShow(itemsLS, slider) {
	//	if (itemsLs > 3) {
	//var slider = $('#elements');
	$(slider).slick({
		dots: false,
		// centerMode: true,
		//cssEase: 'linear',
		//infinite: false,
		// speed: 3000,
		autoplay: true,
		autoplaySpeed: 3000,
		// speed: 3000,
		initialSlide: 0,
		speed: 500,
		slidesToShow: 3,
		slidesToScroll: 1,
		responsive: [{
				breakpoint: 1024,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1,
					infinite: true,
					dots: false
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 1
				}
			},
			{
				breakpoint: 480,
				settings: {
					autoplay: false,
					slidesToShow: 1,
					slidesToScroll: 1,
					vertical: true
				}
			}
		]
	});

}