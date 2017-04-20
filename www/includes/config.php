<?php
error_reporting(0);
//error_reporting(E_ALL ^ E_NOTICE);

$CONF = $TMPL = array();

// The MySQL credentials
$CONF['host'] = 'localhost';
$CONF['user'] = 'illigosg_sab';
$CONF['pass'] = 'sab@97597460';
$CONF['name'] = 'illigosg_sab';

// The Installation URL
$CONF['url'] = 'http://illigo.sg/sab';

// The Notifications e-mail
$CONF['email'] = '';

// The themes directory
$CONF['theme_path'] = 'themes';

$action = array('admin'			=> 'admin',
				'feed'			=> 'feed',
				'settings'		=> 'settings',
				'messages'		=> 'messages',
				'post'			=> 'post',
				'recover'		=> 'recover',
				'timeline'		=> 'timeline',
				'profile'		=> 'profile',
				'notifications'	=> 'notifications',
				'search'		=> 'search',
				'page'			=> 'page'
				);
?>