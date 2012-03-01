# $MidnightBSD: mports/multimedia/schroedinger/Makefile,v 1.2 2011/09/05 16:09:08 laffer1 Exp $

PORTNAME=	schroedinger
PORTVERSION=	1.0.11
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

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^pkgconfigdir=.*|pkgconfigdir="\\$$(prefix)/libdata/pkgconfig"|' ${WRKSRC}/configure

.include <bsd.port.post.mk>
