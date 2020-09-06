<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'admin' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'admin' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '6f+Ge/7~G;bF$QcQl^DRn]m-P&T*=YR!NFgn.L>X|B:;b_|Z*ras?teY~G8&HuJz' );
define( 'SECURE_AUTH_KEY',  'hv)(1%HCl*p8mx;qj.$f*{^qo<sQDqq#U_,!1v_:aj:Kch~]%J<5]X[f-/ Uft&Z' );
define( 'LOGGED_IN_KEY',    'Ug I=*XJHAFv!hl6,*6Cl%M,!S9b9rq3|+_NKq|Z|VUo%^Xo4m<mpl|%<Oif7jHI' );
define( 'NONCE_KEY',        '|_eR(5wn~?1w~V[>|Opp_)5N--BtMCS%*-s[5yo0B#7d[H_bESx)0r?|r6shX}EE' );
define( 'AUTH_SALT',        '9q&e)z;[M$-j9~tIFU%yxhlKGr.<E_M:g{4-T-U<xZoC-.i$/>!Eu*f]W{C,uZVn' );
define( 'SECURE_AUTH_SALT', 'K9H8=FB[IJ!Ho|(^jfOS[$jlMMO(D8yI,K&bgA[c%CV!oEy!l-3,BS&x{D[~8~!P' );
define( 'LOGGED_IN_SALT',   'gHj8$f1p_gXHE.N*v~yqeb6lCoR.z~6tI<YaYA0)|lTffE(TqI/OCuaapxg?D&ho' );
define( 'NONCE_SALT',       '+pFEK+a]o8tZ:=Pr6Q#r(~q~kwO<h:b:.ZA5`A2ic.$(H(Guo>%++@ih/WLI3gAj' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );