# Created by: John Chen <johnpupu@gmail.com>

PORTNAME=	APCu
PORTVERSION=	5.1.18
CATEGORIES=	devel
DISTNAME=	${PORTNAME:tl}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	APC User Caching

LICENSE=	php
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	pecl-APC

USES=		localbase php:pecl
PHP_MODNAME=	${PORTNAME:tl}

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

PLIST_FILES=	${DATADIR}/apc.php

post-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/apc.php ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
