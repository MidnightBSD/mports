# Created by: Olivier Duchateau

PORTNAME=	libnsbmp
PORTVERSION=	0.1.6
CATEGORIES=	graphics
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NetSurf BMP decoder

LICENSE=	mit

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem

USES=		gmake
USE_LDCONFIG=	yes

MAKE_ENV=	COMPONENT_TYPE="lib-shared"

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libnsbmp.so

.include <bsd.port.mk>
