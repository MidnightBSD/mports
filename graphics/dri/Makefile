# $MidnightBSD: mports/graphics/dri/Makefile,v 1.7 2009/05/05 00:48:27 laffer1 Exp $

PORTNAME=	dri
PORTVERSION=	${MESAVERSION}
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES=	graphics

COMMENT=	OpenGL hardware acceleration drivers for the DRI
LICENSE=	x11

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm \
		expat.6:${PORTSDIR}/textproc/expat2
BUILD_DEPENDS=	makedepend:${PORTSDIR}/devel/makedepend

CONFLICTS=	dri-6.2.2005* dri-6.5.2006*
MAKE_JOBS_UNSAFE=	yes
USE_XORG=	glproto x11 xext xxf86vm xdamage xfixes dri2proto

do-install:
	cd ${WRKSRC}/src/mesa; ${GMAKE} ${FAKE_MAKEARGS} install-dri

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"
.include <bsd.port.mk>
