# $MidnightBSD: mports/astro/libnova/Makefile,v 1.3 2009/09/19 23:56:53 laffer1 Exp $

PORTNAME=	libnova
PORTVERSION=	0.13.0
CATEGORIES=	astro
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/V%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Astronomical Calculation Library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnometarget lthack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
