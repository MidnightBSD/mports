PORTNAME=	codeigniter
PORTVERSION=	3.1.13
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for developing PHP web applications
WWW=		https://codeigniter.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		cpe php:web
USE_PHP=	mcrypt pcre session

USE_GITHUB=	yes
GH_ACCOUNT=	bcit-ci
GH_PROJECT=	CodeIgniter

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_SUB=	WWWOWN=${WWWOWN} WWWGRP=${WWWGRP}  DOCSDIR=${DOCSDIR_REL}

# These are all user-configurable files that we'll install
CI_CONF_FILES=	application/config/autoload.php \
		application/config/config.php \
		application/config/constants.php \
		application/config/database.php \
		application/config/doctypes.php \
		application/config/foreign_chars.php \
		application/config/hooks.php \
		application/config/memcached.php \
		application/config/migration.php \
		application/config/mimes.php \
		application/config/profiler.php \
		application/config/routes.php \
		application/config/smileys.php \
		application/config/user_agents.php \
		index.php

OPTIONS_DEFINE=	APACHE MSSQL MYSQLI ODBC PGSQL SQLITE
OPTIONS_SUB=	yes

APACHE_DESC=	Configure for Apache-2.x
MSSQL_DESC=	Install MSSQL support for PHP
MYSQLI_DESC=	Install MySQLi support for PHP
ODBC_DESC=	Install ODBC support for PHP
PGSQL_DESC=	Install PostgreSQL support for PHP
SQLITE_DESC=	Install SQLite support for PHP

APACHE_SUB_FILES=	codeigniter.conf
APACHE_USES=	apache:run
MSSQL_USE=	PHP=mssql
MYSQLI_USE=	PHP=mysqli
ODBC_USE=	PHP=odbc
PGSQL_USE=	PHP=pgsql
SQLITE_USE=	PHP=sqlite3

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} "application index.php system" ${STAGEDIR}${WWWDIR}
.for ci_conf_file in ${CI_CONF_FILES}
	${INSTALL_DATA} ${WRKSRC}/${ci_conf_file} ${STAGEDIR}${WWWDIR}/${ci_conf_file}.sample
.endfor

do-install-APACHE-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/${APACHEETCDIR}/Includes
	${INSTALL_DATA} ${WRKDIR}/codeigniter.conf ${FAKE_DESTDIR}${PREFIX}/${APACHEETCDIR}/Includes/codeigniter.conf

.include <bsd.port.mk>
