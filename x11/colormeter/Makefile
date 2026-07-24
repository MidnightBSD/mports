PORTNAME=	colormeter
DISTVERSION=	1.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 pixel magnifier with live RGB readout
WWW=		https://github.com/FrauBSD/colormeter

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		localbase pkgconfig xorg
USE_GITHUB=	yes
GH_ACCOUNT=	FrauBSD
USE_XORG=	x11 xft

PLIST_FILES=	bin/colormeter

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/colormeter

.include <bsd.port.mk>
