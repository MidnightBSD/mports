# $MidnightBSD: mports/graphics/dri/Makefile,v 1.5 2009/03/15 19:00:33 laffer1 Exp $

PORTNAME=	dri
PORTVERSION=	${MESAVERSION}
PORTEPOCH=	2
CATEGORIES=	graphics

COMMENT=	OpenGL hardware acceleration drivers for the DRI
LICENSE=	x11

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm \
		expat.6:${PORTSDIR}/textproc/expat2
BUILD_DEPENDS=	makedepend:${PORTSDIR}/devel/makedepend

CONFLICTS=	dri-6.2.2005* dri-6.5.2006*

USE_XORG=	glproto x11 xext xxf86vm xdamage xfixes dri2proto

do-install:
	cd ${WRKSRC}/src/mesa; ${GMAKE} ${FAKE_MAKEARGS} install-dri

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"
.include <bsd.port.mk>
