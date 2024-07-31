PORTNAME=	libmcrypt
PORTVERSION=	2.5.8
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	SF/mcrypt/Libmcrypt/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-cipher cryptographic library (used in PHP)
WWW=		https://mcrypt.sourceforge.net/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

CONFIGURE_ARGS=	--enable-static
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool

.include <bsd.port.mk>
