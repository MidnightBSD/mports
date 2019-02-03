# $MidnightBSD$

PORTNAME=	joomla
PORTVERSION=	3.6.5
PORTREVISION=	1
CATEGORIES=	www
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic web content management system (CMS)

LICENSE=	gpl2

GH_PROJECT=	${PORTNAME}-cms

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	MYSQL PGSQL
OPTIONS_DEFAULT=MYSQL
OPTIONS_SUB=	yes

PLIST_SUB=	WWWOWN=${WWWOWN} WWWGRP=${WWWGRP}

USES=		shebangfix
SHEBANG_FILES=	build/indexmaker.php \
		libraries/vendor/leafo/lessphp/lessify

SUB_FILES=	pkg-message

USE_GITHUB=	yes
USE_PHP=	gd json mbstring pcre pdf session simplexml xml zip zlib

MYSQL_USE=	PHP=mysqli
PGSQL_USE=	PHP=pgsql

WANT_PHP_WEB=	yes
WWWDIR=		${PREFIX}/www/${PORTNAME}${PORTVERSION:R:R}

do-install:
	@${MKDIR} ${STAGEDIR}${WWWDIR}
	@(cd ${WRKSRC} && \
		${FIND} . -type d -exec ${MKDIR} ${STAGEDIR}${WWWDIR}/{} \;)
	@(cd ${WRKSRC} && \
		${FIND} . \! -type d -and \! \( -name .gitignore -or -name .travis.yml \
			-or -name travisci-phpunit.xml -or -name LICENSE.txt \
			-or -name README.md \) \
			-exec ${INSTALL_DATA} {} ${STAGEDIR}${WWWDIR}/{} \;)

.include <bsd.port.mk>
