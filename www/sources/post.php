<?php
function PageMain() {
	global $TMPL, $LNG, $CONF, $db, $loggedIn, $settings;
	
	if(isset($_SESSION['username']) && isset($_SESSION['password']) || isset($_COOKIE['username']) && isset($_COOKIE['password'])) {	
		$verify = $loggedIn->verify();
	}
	
	// Start displaying the Feed
	$feed = new feed();
	$feed->db = $db;
	$feed->url = $CONF['url'];
	$feed->user = $verify;
	$feed->id = $verify['idu'];
	$feed->username = $verify['username'];
	$feed->per_page = $settings['perpage'];
	$feed->time = $settings['time'];
	$feed->censor = $settings['censor'];
	$feed->smiles = $settings['smiles'];
	if($_GET['type'] == 'likes') {
		$feed->c_per_page = $settings['cperpage'];
	} else {
		$feed->c_per_page = 99999; // Show n of comments
	}
	$feed->c_start = 0;
	$feed->l_per_post = $settings['lperpost'];
	if(isset($_SESSION['usernameAdmin']) && isset($_SESSION['passwordAdmin'])) {
		$loggedInAdmin = new loggedInAdmin();
		$loggedInAdmin->db = $db;
		$loggedInAdmin->url = $CONF['url'];
		$loggedInAdmin->username = $_SESSION['usernameAdmin'];
		$loggedInAdmin->password = $_SESSION['passwordAdmin'];
		$loggedIn = $loggedInAdmin->verify();
		
		if($loggedIn['username']) {
		// Set admin level
		$feed->is_admin = 1;
		}
	}
	
	$TMPL_old = $TMPL; $TMPL = array();
	$skin = new skin('post/rows'); $rows = '';
	
	if(empty($_GET['filter'])) {
		$_GET['filter'] = '';
	}
	// If the message id is not set, or it doesn't consist from digits
	if(!isset($_GET['m']) || !ctype_digit($_GET['m'])) {
		header("Location: ".$CONF['url']);
	}
	
	$message = $feed->getMessage($_GET['m']);
	$TMPL['messages'] = $message[0];
	
	// Match the content from the song-title class in order to set it for the title tag
	preg_match_all('/<div.*(class="message-message").*>([\d\D]*)<\/div>/iU', $message[0], $title);
	if(empty($title[2][0])) {
		preg_match_all('/<div.*(class="message-header").*>([\d\D]*)<\/div>/iU', $message[0], $title);
		if($title[2]) {
			$private = 1;
		}
	}

	if($_GET['type'] == 'likes') {
		$skin = new skin('shared/rows'); $rows = '';
		
		if(!$private) {
			// Remove all white spaces and do a check for content
			$content = preg_replace('/\s+/', '', substr(strip_tags($title[2][0]), 0, 80));
			$message = strip_tags(trim($title[2][0]));
			$TMPL['messages'] = '<div class="message-container"><div class="message-content"><div class="message-header"><a href="'.$CONF['url'].'/index.php?a=post&m='.$_GET['m'].'">'.$LNG['title_post'].'</a> - '.$LNG['likes'].'</div>'.((!empty($content)) ? '<div class="message-inner"><div class="message-message">'.(($feed->parseMessage(strlen($message)) > 80) ? $feed->parseMessage(substr($message, 0, 80)).' <a href="'.$CONF['url'].'/index.php?a=post&m='.$_GET['m'].'">[...]</a>' : $feed->parseMessage($message).'') : '').'</div></div></div></div>';
			$TMPL['messages'] .= $feed->getLikes(0, 2, $_GET['m']);
		}
	}
	
	// If the output is empty redirect to home-page
	if(!$title[2]) {
		header("Location: ".$CONF['url']);
	}
	
	$rows = $skin->make();
	
	$skin = new skin('post/sidebar'); $sidebar = '';
	
	$TMPL['ad'] = generateAd($settings['ad5']);

	$sidebar = $skin->make();
	
	$TMPL = $TMPL_old; unset($TMPL_old);
	$TMPL['rows'] = $rows;
	$TMPL['sidebar'] = $sidebar;
	
	if(isset($_GET['logout']) == 1) {
		$loggedIn->logOut();
		header("Location: ".$CONF['url']."/index.php?a=welcome");
	}

	$TMPL['url'] = $CONF['url'];

	$TMPL['title'] = $LNG['title_post'].' - '.(($_GET['type'] == 'likes') ? $LNG["{$_GET['type']}"].' - ' : '').substr(strip_tags($title[2][0]), 0, 40).((!$private) ? '...' : '').' - '.$settings['title'];
	$skin = new skin('shared/timeline_x');
	return $skin->make();
}
?>