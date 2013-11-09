# $MidnightBSD$

PORTNAME=	fribidi
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	converters 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension for the unicode Bidi algorithm

LICENSE=	php

LIB_DEPENDS=	fribidi.3:${PORTSDIR}/converters/fribidi

USES=		pkgconfig

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-fribidi=${LOCALBASE}

.include <bsd.port.mk>
