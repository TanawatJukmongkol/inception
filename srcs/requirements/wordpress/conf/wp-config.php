<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$DB_NAME' );

/** MySQL database username */
define( 'DB_USER', '$DB_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$DB_PASSWORD' );

/** MySQL hostname */
define( 'DB_HOST', '$DB_HOST' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

define( 'WP_SITEURL', '$WP_SITEURL' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '3#Lsp{Np2/r>ge5iacE&U9N|X^-s+yfNNK>=nxbw`{jxZ==.D7UKCL{n)Kv#vBdT');
define('SECURE_AUTH_KEY',  ',o:oW+01s[|j)i1XNF_lQ1>^5U?:$Jb[~!g4efW8*F&`VG8X,-^M0hqa+{>m@TJo');
define('LOGGED_IN_KEY',    'P5^)aPAws@ |WoqG_UGv>pn+mHus?]7+zwPDvmVJfcYpz+ILkd5IX|P*$4E:T[3U');
define('NONCE_KEY',        '1Ge,ncOk5F-$q>_Q&U4F;pc=#@-xC[{O{Z`AOkTWAdDGM>8r!.|84.Odc,h]C?I=');
define('AUTH_SALT',        '&w:R38IyT:zu7IwS~()5mYpw.w&_Xmgni3fTtgcY}Hh>U#3EO!+W=,S=g=?5wI~-');
define('SECURE_AUTH_SALT', '_=v]9?S>e[_zY|=rmz+.(!qGr}$?tG<h4S#_-,9N[iEWLHSU =gF+$g*+`^14Ak$');
define('LOGGED_IN_SALT',   '2l TS_X=p@XRd1|{R(Rqi?CCYu>v>RW/+yem_I+ jbXIg@@JU+_d+!*|iC|-~s-$');
define('NONCE_SALT',       '++WX=Le{[}x9mw|2}Xm Jb!}5^*pT^8mI=Cc^Hp>+>[6bi;< .=7,WHV_!U-+o+4');
	

define('WP_CACHE', true);

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>%
