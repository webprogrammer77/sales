<div id="gk-footer" class="clearfix">

	<?php if( $this->countModules('footnav') ): ?>

	<div class="gk-footnav">

		<jdoc:include type="modules" name="footnav" />

	</div>

	<?php endif; ?>	

		

	<?php if($this->_tpl->params->get('stylearea')) : ?>

	<div id="stylearea">

		<a href="#" class="style_switcher" id="style_switcher1">Red</a>

		<a href="#" class="style_switcher" id="style_switcher2">Blue</a>

		<a href="#" class="style_switcher" id="style_switcher3">Green</a>

	</div>

	<?php endif; ?>		



	<div class="gk-copyright">

		<?php



			if (($mobile = $this->mobile_device_detect())) : 

				$handheld_view = $this->getParam('ui');

				$switch_to = $handheld_view=='desktop'?'default':'desktop';

				$text = $handheld_view=='desktop'?'Mobile Version':'Desktop Version';

		?>



			<a class="gk-tool-switchlayout" href="<?php echo JURI::base()?>?ui=<?php echo $switch_to?>" title="<?php echo JText::_($text)?>"><span><?php echo JText::_($text)?></span></a>



		<?php endif ; ?>
        Интернет-магазин шин <?php echo $_SERVER["SERVER_NAME"]; ?> © 2007-<?php echo date('Y') ?> Все права защищены.

	</div>

</div>
<!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=30249031&amp;from=informer"
target="_blank" rel="nofollow"><img src="https://informer.yandex.ru/informer/30249031/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" class="ym-advanced-informer" data-cid="30249031" data-lang="ru" /></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter30249031 = new Ya.Metrika({
                    id:30249031,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/30249031" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<!---<script id="huckster"> (function(w,d,s,c) { var h=document.getElementById('huckster'),r=d.createElement('script');w.Huckster={};w.Huckster.config=c||{};w.Huckster.config.server=s;r.setAttribute('src', '//'+Huckster.config.server+'/app/huckster.min.js');h.parentNode.insertBefore(r,h.nextSibling); })(window,document,'files.hucksterbot.com',{companyId:817}); </script>-->
<!-- ===== webprogrammer77 sales ==== start-->

	<div id="popup-sale" class="popup-sale">
 		<div class="popup-sale__overlay"></div>
		
		<a id="popup-sale__close" href="#" id="popup-sale__close">&#9421;</a>
	
		<div class="popup-sale__header">
		<p class="popup-sale__header-tit">ПЕРСОНАЛЬНОЕ ПРЕДЛОЖЕНИЕ</p>
			<p class="popup-sale__header-sub">Просто выберите товар</p>
		</div>
<div class="popup-sale__slider " id="elements">

		</div>
		 <form class="form-sale" id="sale-form" action="http://s-tor.ru/tyres/sales/mail/mail.php" name="sale-form" method="post">
          <div class="form-sale__row">
            <label for="phone">Введите ваш номер телефона</label>
            <div class="er-phone">Проверьте правильность телефона          </div>
            <input class="form-sale__input phone-mask mask" id="phone" name="phone" type="text" placeholder="Ваш телефон" required="">
            <input class="sale-name-hide" name="name" type="hidden" value=" Бассейн INTEX 28132 &quot;EASY&quot;, насос 220V, 366х76 см">
            <input class="sale-price-hide" name="price" type="hidden" value=" 5395р.">
            <input class="sale-sale-hide" name="sale" type="hidden" value=" 4%">
            <input class="sale-url-hide" name="url" type="hidden">
            <input class="sale-sku-hide" name="sku" type="hidden">
            <button class="form-sale__button" name="button-sale" type="submit" value="Хочу скидку" form="sale-form">Хочу скидку</button>
          </div>
          <div class="police__open">Нажимая кнопку "Хочу скидку" вы соглашаетесь с политикой конфеденциальности нашего сайта.</div>
        </form>
	</div>
	<div id="sale-button" href="#" class="sale-button">
<a class="sale-button__link">
<span class="sale-button__percent"></span>
		</a>
<p class="sale-button__label">Получи
			<br>скидку</p>
	</div>


	<div class="status-popup popup" id="success">
		<div class="status-popup__inner">
			<div class="status-popup__message">Спасибо! Наш менеджер скоро свяжется с вами.</div>
			<div class="status-popup__close">Закрыть</div>
		</div>
	</div>
	<div class="status-popup popup" id="error">
		<div class="status-popup__inner">
			<div class="status-popup__message error-message">К сожалению, произошла ошибка</div>
			<div class="status-popup__close">Закрыть</div>
		</div>
	</div>
	<div class="police">
		<div class="police-title">
			<a id="police__close" href="#" class="police__close">&#9421;</a>

			<b>Политика конфиденциальности</b>
		</div>
		<hr>

		
		<p>Политика конфиденциальности сайта <?php
		error_reporting( E_ERROR );
function curPageURL() {
 $pageURL = 'http';
 //if ($_SERVER["HTTPS"] == TRUE) {$pageURL .= "s";}
 $pageURL .= "://";
 if ($_SERVER["SERVER_PORT"] != "80") {
  $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
 } else {
  $pageURL .= $_SERVER["SERVER_NAME"];
 }
 return $pageURL;
}
echo curPageURL();
error_reporting( E_ERROR );
?> (именуемый в дальнейшем "сайт")</p>
		<p>
			Владелец сайта (именуемый в дальнейшем "Администрация") обязуется сохранять Вашу конфиденциальность в сети Интернет. Настоящая
			Политика Конфиденциальности, рассказывает о том, как собираются, обрабатываются и хранятся Ваши личные данные.
		</p>
		<p>Администрация уделяет большое внимание защите личной информации пользователей. </p>
		<p>
			Пользуюсь этим сайтом, пользователь тем самым дает согласие на применение правил сбора и использования данных, изложенных
			в настоящем документе.</p>
		<b>Если Вы не согласны с условиями нашей политики конфиденциальности, не используйте этот сайт!</b>
		<p>Собираемая информация</p>
		<p>
			Администрация не собирает никакой личной информации о пользователе. Однако, личную информацию пользователя могут собирать
			внешние организации (третьи стороны), предоставляющие инструменты для сбора информации о состоянии сайта. По этой причине,
			Администрация снимает с себя ответственность по сохранению конфиденциальности данных пользователя. С Условиями Конфиденциальности
			третьих сторон, пользователь может ознакомиться на их сайтах.
		</p>
		<p>Прочая информация</p>
		<p>Дети любых возрастов могут беспрепятственно пользоваться данным сайтом.</p>
	</div>


<!-- ===== webprogrammer77 sales ==== finish-->
<!-- === webprogrammer77 sales start=== -->


  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/slider/slick/slick.min.js"></script>
  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/mail/form.js"></script>
  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/mail/jquery.inputmask.bundle.js"></script>
  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/mail/phone.min.js"></script>
  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/mail/phone-be.min.js"></script>
  <script type="text/javascript" src="http://s-tor.ru/tyres/sales/mail/phone-ru.min.js"></script>

<script type="text/javascript" src="http://s-tor.ru/tyres/sales/sales.js"></script> 

<!--<script src="<?php echo $this->baseurl;?>sales/mail/form.js" type="text/javascript"></script>-->	
<!-- === webprogrammer77 sales finish=== -->