# $MidnightBSD$

PORTNAME=	libnova
PORTVERSION=	0.15.0
PORTREVISION=	4
CATEGORIES=	astro
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/v%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Astronomical Calculation Library

LICENSE=	lgpl

USES=		autoreconf libtool
USE_AUTOTOOLS=	libtoolize
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g' ${WRKSRC}/configure

.include <bsd.port.mk>
