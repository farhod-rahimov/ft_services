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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'E%.4Y0rLvQsank-_I|/%_>;6nw+t=KNVF&!c3=hDX$_b@!?lv}={I#yC33C_,4&w');
define('SECURE_AUTH_KEY',  'hjYUbdUg8) Sj-p`,];4j:XV~K!!yzLfS/MT!TuY8gjP3m,&l?TSLN$-:OLl{x|p');
define('LOGGED_IN_KEY',    '8BFJWB;Sqqfb|C|Wz$!IB86bo/:.@@fOFWF`6l?YpW{XyiGMkR@p||tnlPZedH~%');
define('NONCE_KEY',        'vE3Swc)x1!pn{Rm`bX%70{88&[od>64tRCE{Oa+|g<cG9*?~([ez:1?,cHr5|sS1');
define('AUTH_SALT',        'q-+Iw}Yydc|$}x`$kZ*}]qoX7Diq()*1Fq.;bpp(`+aAf3Y(}}XC.kU3]B5<SHc0');
define('SECURE_AUTH_SALT', 'SbE;B|>(;]_/X4 O@3NMNR-T;M!m|>w9z_+BCN-]%<gb_J+Np7`T!hQO:]p%@<FV');
define('LOGGED_IN_SALT',   'Uz%=^3W-bjIsp`2I8`YE-WcEy0x%L^]flbq771X|iH.n+q@c1J-L6Wy{-8*KfC)V');
define('NONCE_SALT',       'hhwho0KP@f:hXyMCWN|+#nF=a<-{|gmj{#EXF*#G6B@K~_jAwyJXnOYKIqEBkX[_');

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';