PORTNAME=	lsblk
PORTVERSION=	3.7
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/vermaden/lsblk/raw/master/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists information about block devices in the system
WWW=		https://github.com/vermaden/lsblk

LICENSE=	bsd2

NO_ARCH=	YES
NO_BUILD=	YES

PLIST_FILES=	sbin/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/lsblk.sh \
	${STAGEDIR}${PREFIX}/sbin/${PORTNAME}

.include <bsd.port.mk>

