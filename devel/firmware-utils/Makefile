PORTNAME=	firmware-utils
PORTVERSION=	20111222
CATEGORIES=	devel
MASTER_SITES=	http://www.transit.hanse.de/mirror/svn.openwrt.org/firmware-utils/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create device firmware images
WWW=		https://www.openwrt.org/

LICENSE=	gpl2

USES=		ssl tar:bzip2

MAKEFILE=	${FILESDIR}/Makefile
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_PROGRAM}" PREFIX=${PREFIX}
LDFLAGS+=	-L${OPENSSLLIB}

.include <bsd.port.mk>
