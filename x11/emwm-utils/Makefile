PORTNAME=	utils
DISTVERSION=	1.2
CATEGORIES=	x11
MASTER_SITES=	http://fastestcode.org/dl/
PKGNAMEPREFIX=	emwm-
DISTNAME=	emwm-utils-src

MAINTAINER=	kazuok@projectkitsune.com
COMMENT=	Collection of helper tools for emwm

LICENSE=	mit

USES=		motif pkgconfig tar:xz xorg
USE_XORG=	x11 xt xext xinerama xpm xrandr xscrnsaver

WRKSRC=		${WRKDIR}/utils

post-patch:
	${LN} -sf ${WRKSRC}/mf/Makefile.FreeBSD ${WRKSRC}/mf/Makefile.MidnightBSD

.include <bsd.port.mk>
