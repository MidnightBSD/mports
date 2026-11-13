# Created by: John Chen <johnpupu@gmail.com>

PORTNAME=	APCu
PORTVERSION=	5.1.28
PORTREVISION=	1
CATEGORIES=	devel
DISTNAME=	${PORTNAME:tl}-${PORTVERSION}

PATCH_SITES=	https://github.com/krakjoe/apcu/commit/
PATCHFILES=	90899684be91c4f750512c2f840f487286ecb807.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	APC User Caching

LICENSE=	PHP301
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	pecl-APC

USES=		localbase php:pecl
PHP_MODNAME=	${PORTNAME:tl}

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

PLIST_FILES=	${DATADIR}/apc.php

post-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/apc.php ${DATADIR}

.include <bsd.port.mk>
