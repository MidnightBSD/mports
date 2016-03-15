# Created by: Babak Farrokhi <babak@farrokhi.net>
# $FreeBSD: head/net-mgmt/phpip/Makefile 411002 2016-03-13 16:56:42Z mat $
# $MidnightBSD$

PORTNAME=	phpip
PORTVERSION=	${SNAPSHOT}
CATEGORIES=	net-mgmt www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/4.3.2%20-%20No%20Upgrade%20Support
DISTNAME=	${PORTNAME}-4.3.2-build-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Complete IPv4 IPAM (IP address management) suite

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

SNAPSHOT=	200611081420
NO_BUILD=	yes
USE_PHP=	mysql
USES=		dos2unix
WANT_PHP_WEB=	yes

IGNORE_WITH_PHP=	70

PHPIP?=		www/phpip
PLIST_SUB+=	PHPIP=${PHPIP} WWWOWN=${WWWOWN} WWWGRP=${WWWGRP}

pre-patch: dos2unix

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${PHPIP}
	@${CP} -R ${WRKSRC}/ ${STAGEDIR}${PREFIX}/${PHPIP}
	@${CHMOD} -R 755 ${STAGEDIR}${PREFIX}/${PHPIP}

.include <bsd.port.mk>
