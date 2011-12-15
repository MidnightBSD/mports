# $MidnightBSD: mports/astro/libnova/Makefile,v 1.5 2011/02/02 20:03:22 laffer1 Exp $

PORTNAME=	libnova
PORTVERSION=	0.13.0
PORTREVISION=	2
CATEGORIES=	astro
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/V%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Astronomical Calculation Library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_GNOME=	lthack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
