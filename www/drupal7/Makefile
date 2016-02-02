# Created by: Nick Hilliard <nick@foobar.org>
# $FreeBSD: head/www/drupal7/Makefile 395015 2015-08-22 06:58:32Z delphij $

PORTNAME=	drupal7
PORTVERSION=	7.41
CATEGORIES=	www
MASTER_SITES=	http://ftp.drupal.org/files/projects/
DISTNAME=	drupal-${PORTVERSION}
DIST_SUBDIR=	drupal

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database driven web content management system (CMS)

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

USES=		drupal:7 shebangfix
SHEBANG_FILES=	scripts/password-hash.sh

USE_PHP=	dom filter gd hash json mbstring pcre pdo session simplexml xml
WANT_PHP_WEB=	yes

OPTIONS_DEFINE=		MYSQL SQLITE3 PGSQL DOCS
OPTIONS_DEFAULT=	MYSQL

NO_BUILD=	yes
DOCS=		CHANGELOG.txt INSTALL.mysql.txt INSTALL.sqlite.txt \
		LICENSE.txt README.txt COPYRIGHT.txt INSTALL.pgsql.txt \
		INSTALL.txt MAINTAINERS.txt UPGRADE.txt

SUB_FILES+=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PGSQL_USES=	pgsql
PGSQL_USE=	PHP=pdo_pgsql

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSQLITE3}
USE_PHP+=	pdo_sqlite
.endif
.if ${PORT_OPTIONS:MMYSQL}
USE_MYSQL=	yes
USE_PHP+=	pdo_mysql
.endif

do-install:
	${MKDIR} ${DRUPAL_DIR}
	${CP} ${WRKSRC}/.htaccess ${DRUPAL_DIR}
	${CP} ${WRKSRC}/cron.php ${DRUPAL_DIR}
	${CP} ${WRKSRC}/authorize.php ${DRUPAL_DIR}
	${CP} -R ${WRKSRC}/includes ${DRUPAL_DIR}
	${CP} ${WRKSRC}/index.php ${DRUPAL_DIR}
	${CP} ${WRKSRC}/install.php ${DRUPAL_DIR}
	${CP} -R ${WRKSRC}/misc ${DRUPAL_DIR}
	${CP} -R ${WRKSRC}/modules ${DRUPAL_DIR}
	${CP} -R ${WRKSRC}/profiles ${DRUPAL_DIR}
	${CP} ${WRKSRC}/robots.txt ${DRUPAL_DIR}
	${CP} -R ${WRKSRC}/scripts ${DRUPAL_DIR}
	${MKDIR} ${DRUPAL_DIR}/sites/all
	${MKDIR} ${DRUPAL_DIR}/sites/all/libraries
	${CP} ${WRKSRC}/sites/example.sites.php ${DRUPAL_DIR}/sites/
	${CP} -R ${WRKSRC}/sites/all ${DRUPAL_DIR}/sites/
	${MKDIR} ${DRUPAL_DIR}/sites/default
	${MKDIR} ${DRUPAL_DIR}/sites/default/files
	${CP} ${WRKSRC}/sites/default/default.settings.php ${DRUPAL_DIR}/sites/default/default.settings.php.sample
	${CP} -R ${WRKSRC}/themes ${DRUPAL_DIR}
	${CP} ${WRKSRC}/update.php ${DRUPAL_DIR}
	${CP} ${WRKSRC}/web.config ${DRUPAL_DIR}
	${CP} ${WRKSRC}/xmlrpc.php ${DRUPAL_DIR}
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${CP} ${DOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
