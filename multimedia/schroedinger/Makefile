# $MidnightBSD: mports/multimedia/schroedinger/Makefile,v 1.3 2012/03/01 04:28:12 laffer1 Exp $

PORTNAME=	schroedinger
PORTVERSION=	1.0.11
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://diracvideo.org/download/schroedinger/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-speed Dirac codec
LICENSE=	agg

LIB_DEPENDS=	orc-0.4:${PORTSDIR}/devel/orc
BUILD_DEPENDS=	orc>=0.4.16:${PORTSDIR}/devel/orc

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^pkgconfigdir=.*|pkgconfigdir="\\$${prefix}/libdata/pkgconfig"|' \
		-e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure

.include <bsd.port.mk>
