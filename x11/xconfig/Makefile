PORTNAME=	xconfig
PORTVERSION=	0.99
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MidnightBSD X configuration tool
WWW=		https://github.com/midnightbsd/xconfig

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	MidnightBSD
GH_TAGNAME=	1942c9ffaa27f612c4a80eca09cec113f3f47dd1

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/X11/cardDetect
	${CP} -PR ${WRKSRC}/cardDetect/XF86Config.* ${PREFIX}/etc/X11/cardDetect
	${INSTALL_SCRIPT} ${WRKSRC}/bin/xconfig ${PREFIX}/bin

.include <bsd.port.mk>
