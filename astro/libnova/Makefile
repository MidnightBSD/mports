# $MidnightBSD$

PORTNAME=	libnova
PORTVERSION=	0.14.0
PORTREVISION=	3
CATEGORIES=	astro
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/v%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Astronomical Calculation Library

LICENSE=	lgpl

USES=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
