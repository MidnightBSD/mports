PORTNAME=	libxcvt
DISTVERSIONPREFIX=	${PORTNAME}-
DISTVERSION=	0.1.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Calculate VESA CVT mode lines

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

WRKSRC=	${WRKDIR}/libxcvt-${GL_COMMIT}

USES=		meson
USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	xorg/lib
GL_COMMIT=	6fe840b9295cfdc41bd734586c5b8756f6af6f9b

.include <bsd.port.mk>
