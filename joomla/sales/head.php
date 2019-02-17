<?php if($this->_tpl->params->get("chrome_frame")) : ?>

<meta http-equiv="X-UA-Compatible" content="chrome=1"/>
<?php endif; ?>

  <meta name="Author" Content="Alexey Kovanev">

<jdoc:include type="head" />
<!-- webprogrammer77 стили sales start-->
<?php  
$doc = JFactory::getDocument();
$baseUrl = JUri::base();
$doc->addStyleSheet($baseUrl.'sales/slider/slick/slick.css');
$doc->addStyleSheet($baseUrl.'sales/slider/slick/slick-theme.css');
$doc->addStyleSheet($baseUrl.'sales/style.css');

$doc->addScript($baseUrl.'sales/js/modernizr-custom.js');
$doc->addScript($baseUrl.'sales/js/jquery/jquery-1.8.1.min.js');
//$doc->addScript($baseUrl.'sales/js/jquery/jquery-migrate-1.4.1.min.js');
//$doc->addScript($baseUrl.'sales/js/jquery/jquery-migrate-3.0.0.min.js');
//$doc->addScript($baseUrl.'sales/slider/slick/slick.min.js');
?>  
<script>
jQuery.noConflict();
</script>
<!-- webprogrammer77 стили sales finish-->

<?php JHTML::_('behavior.mootools'); ?>



<?php if (!$this->isIE6()) : ?>



<?php

	// Loading DomReady fix for IE browser

	$document =& JFactory::getDocument();

	$headData = $document->getHeadData();

	$scripts_array_keys = array_keys($headData['scripts']);

	$headData['scripts'] = array();

	foreach($scripts_array_keys as $key)

	{

		$headData['scripts'][$key] = 'text/javascript';

		

		if(preg_match('/mootools.js/',$key))

		{

			$headData['scripts'][$this->templateurl().'/js/domready_fix.js'] = 'text/javascript';

		}

	}

	$document->setHeadData($headData);



	$document->addStylesheet($this->baseurl() . 'templates/system/css/system.css');

	$document->addStylesheet($this->baseurl() . 'templates/system/css/general.css');

	$document->addStylesheet($this->templateurl() . '/css/addons.css');

	$document->addStylesheet($this->templateurl() . '/css/layout.css');

	$document->addStylesheet($this->templateurl() . '/css/template.css');

	$document->addStylesheet($this->templateurl() . '/css/joomla.css');

	$document->addStylesheet($this->templateurl() . '/css/gk_stuff.css');

	$document->addStylesheet($this->templateurl() . '/css/typo.css');

	

    if($this->_tpl->params->get("vm_support")) {

        $document->addStylesheet($this->templateurl() . '/css/vm/vm_major.css');

        $document->addStylesheet($this->templateurl() . '/css/vm/vm_gk_flypage.css');

        $document->addStylesheet($this->templateurl() . '/css/vm/browse_notables.css');

    }

    

    if($this->_tpl->params->get("css3")) $document->addStylesheet($this->templateurl() . '/css/css3.css');



    $template_style = '';

	if($this->getParam("stylearea")) $template_style = (isset($_COOKIE['gk37_style']) ? $_COOKIE['gk37_style'] : $this->getParam("template_color"));

	else $template_style = $this->getParam("template_color");

	

    $document->addStylesheet($this->templateurl() . '/css/style'.$template_style.'.css');



?>



<!--[if lt IE 8.0]><link rel="stylesheet" href="<?php echo $this->templateurl(); ?>/css/ie.css" type="text/css" /><![endif]-->

<!--[if IE 8.0]><link rel="stylesheet" href="<?php echo $this->templateurl(); ?>/css/ie8.css" type="text/css" /><![endif]-->

<!--[if IE 7.0]><style>.clearfix { display: inline-block; } /* IE7xhtml*/</style><![endif]-->



<script type="text/javascript">

var siteurl='<?php echo $this->baseurl();?>';

var tmplurl='<?php echo $this->templateurl();?>';

</script>



<?php if (($gkmenu = $this->loadMenu())) $gkmenu->genMenuHead (); ?>

<?php $this->loadBlock('cufon'); ?>



<!--Width of template -->

<style type="text/css">

.main {width: <?php echo $this->getParam('tmplWidth', 'auto', true); ?>;margin: 0 auto;}

</style>



<?php else : ?>

<link href="<?php echo $this->templateurl(); ?>/css/ie6.css" rel="stylesheet"/>

<?php endif; ?>  



<?php if($this->getParam('css_override')) $document->addStylesheet($this->templateurl() . '/css/override.css'); ?>

<?php /*?><script type="text/javascript">

 // Add a script element as a child of the body
 function downloadJSAtOnload() {
 var element = document.createElement("script");
 element.src = "<?php echo $this->templateurl() . '/js/gk.script.js'; ?>";
 document.body.appendChild(element);
 }

 // Check for browser support of event handling capability
 if (window.addEventListener)
 window.addEventListener("load", downloadJSAtOnload, false);
 else if (window.attachEvent)
 window.attachEvent("onload", downloadJSAtOnload);
 else window.onload = downloadJSAtOnload;

</script><?php */?>

<script type="text/javascript" src="<?php echo $this->templateurl() . '/js/gk.script.js'; ?>"></script>