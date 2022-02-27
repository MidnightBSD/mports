# Created by: Kazuo Kuroi <kazuok@midnightbsd.org>

PORTNAME=	ximaging
DISTVERSION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://fastestcode.org/dl/
DISTNAME=	ximaging-src

MAINTAINER=	kazuok@midnightbsd.org
COMMENT=	Motif-based image viewer ala xv

LICENSE=	mit

LIB_DEPENDS+=	libtiff.so:graphics/tiff

USES=		motif pkgconfig tar:xz xorg

USE_XORG=	x11 xt xext xinerama xpm xscrnsaver

WRKSRC=		${WRKDIR}/ximaging

.include <bsd.port.mk>
