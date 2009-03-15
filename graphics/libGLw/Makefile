# $MidnightBSD: mports/graphics/libGLw/Makefile,v 1.1 2009/03/15 19:00:34 laffer1 Exp $

PORTNAME=	libGLw
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics

COMMENT=	OpenGL widgets library

BUILD_DEPENDS+=	makedepend:${PORTSDIR}/devel/makedepend
LIB_DEPENDS+=	Xm.3:${PORTSDIR}/x11-toolkits/open-motif

USE_GL=		gl
USE_XORG=	glproto xt x11 xext xxf86vm xdamage xfixes dri2proto

do-install:
	cd ${WRKSRC}/src/glw; ${GMAKE} ${FAKE_MAKEARGS} install

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"
.include <bsd.port.mk>
