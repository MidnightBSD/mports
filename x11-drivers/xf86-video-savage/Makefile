PORTNAME=	xf86-video-savage
PORTVERSION=	2.3.9
PORTREVISION=	7
CATEGORIES=	x11-drivers

PATCH_SITES=	https://gitlab.freedesktop.org/xorg/driver/${PORTNAME}/commit/
PATCHFILES+=	0ece556daa8a88771b669d8104396abd9166d2d0.diff:-p1

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	X.Org savage display driver
WWW=		https://www.x.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gl xorg-cat:driver
USE_GL=		gl

.include <bsd.port.mk>
