# $MidnightBSD$

PORTNAME=	libmcrypt
PORTVERSION=	2.5.8
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	SF/mcrypt/Libmcrypt/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-cipher cryptographic library (used in PHP)

LICENSE=	lgpl2.1

CONFIGURE_ARGS=	--enable-static
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool

.include <bsd.port.mk>
