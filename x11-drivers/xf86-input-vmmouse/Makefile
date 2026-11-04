PORTNAME=	xf86-input-vmmouse
PORTVERSION=	13.1.0
PORTREVISION=	4
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver
WWW=		https://www.x.org/

LICENSE=	mit

USES=		gmake xorg-cat:driver
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	vmmouse protocol is only supported on x86-compatible architectures

.include <bsd.port.mk>
