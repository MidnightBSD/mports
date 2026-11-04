PORTNAME=	sct
DISTVERSION=	1.0.0
PORTREVISION=	1
CATEGORIES=	accessibility

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to change screen temperature
WWW=		https://github.com/0mp/sct

LICENSE=	unlicense
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		xorg
USE_GITHUB=	yes
GH_ACCOUNT=	0mp
USE_XORG=	x11 xrandr
INSTALL_TARGET=	install-strip

do-install:
	${CP} ${WRKSRC}/sct ${PREFIX}/bin/sct
	${CP} ${WRKSRC}/sct.1 ${PREFIX}/share/man/man1/

.include <bsd.port.mk>
