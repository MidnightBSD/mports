PORTNAME=	xf86-video-geode
PORTVERSION=	2.18.2
PORTREVISION=	0
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org geode display driver
WWW=		https://www.x.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg-cat:driver

ONLY_FOR_ARCHS=	i386
ONLY_FOR_ARCHS_REASON=	Geode processors are 32bit x86 only

.include <bsd.port.mk>
