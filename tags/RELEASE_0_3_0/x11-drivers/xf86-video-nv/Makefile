# $MidnightBSD$

PORTNAME=	xf86-video-nv
PORTVERSION=	2.1.17
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org nv display driver
LICENSE=	mit

XORG_CAT=	driver
USE_XORG=	videoproto xextproto
MAN4=		nv.4x

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
USE_GCC=	4.2+
.endif

.include <bsd.port.post.mk>
