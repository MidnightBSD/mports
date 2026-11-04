PORTNAME=	libutp
DISTVERSION=	g20231123
CATEGORIES=	net-p2p

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	uTorrent Transport Protocol library and sample utilities.
WWW=		https://github.com/transmission/libutp

LICENSE=	mit

USES=		cmake uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	transmission
GH_TAGNAME=	52645d6

USE_LDCONFIG=	yes
CMAKE_ON=	LIBUTP_SHARED
CMAKE_OFF=	LIBUTP_ENABLE_WERROR
CMAKE_BUILD_TYPE=	Release

.include <bsd.port.mk>
