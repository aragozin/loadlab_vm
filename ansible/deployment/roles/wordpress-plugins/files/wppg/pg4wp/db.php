<?php

defined( 'ABSPATH' ) or die();

if( !defined('DB_DRIVER') ){
	define('DB_DRIVER', 'pgsql'); // 'pgsql' or 'mysql' are supported for now
}

if( !defined('WP_USE_EXT_MYSQL') ){
	define('WP_USE_EXT_MYSQL', true); // use external mysql
}

// Set this to 'true' and check that `pg4wp` is writable if you want debug logs to be written
define( 'PG4WP_DEBUG', false);
// If you just want to log queries that generate errors, leave PG4WP_DEBUG to "false"
// and set this to true
define( 'PG4WP_LOG_ERRORS', false);

// If you want to allow insecure configuration (from the author point of view) to work with PG4WP,
// change this to true
define( 'PG4WP_INSECURE', false);

// This defines the directory where PG4WP files are loaded from
define( 'PG4WP_ROOT', ABSPATH.'wp-content/plugins/wppg/pg4wp');

// Here happens all the magic
include( PG4WP_ROOT.'/core.php');
