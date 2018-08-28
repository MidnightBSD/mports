# $MidnightBSD$

PORTNAME=	imlib2
PORTVERSION=	0.1.00
CATEGORIES=	graphics
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension if imlib2

LICENSE=	php

LIB_DEPENDS=	libImlib2.so:${PORTSDIR}/graphics/imlib2

USES=		tar:tgz
USE_PHP=	yes
USE_PHPEXT=	yes

# libImlib2 may or may not depend on X, however,
# imlib2 extension doesn't need X related functions in libImlib2
CFLAGS+=	-DX_DISPLAY_MISSING -Wno-deprecated

post-patch:
	@${REINPLACE_CMD} -e 's/-ldl//' ${WRKSRC}/config.m4
	@${REINPLACE_CMD} -e 's,/usr/share,${LOCALBASE}/share,' ${WRKSRC}/imlib2.c

.include <bsd.port.mk>
