# Created by: Albert Vernon <f3cun3c02@sneakemail.com>

PORTNAME=	zutils
PORTVERSION=	1.11
CATEGORIES=	archivers
MASTER_SITES=	SAVANNAH/zutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for searching in bzip2, gzip, lzip, and xz archives

LICENSE=	gpl2

USES=		cpe tar:lz
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	nongnu

CONFLICTS_INSTALL=	gzip openzfs

INFO=		zutils

post-patch:
	# Remove compiler hardcoded flags and use environment
	@${REINPLACE_CMD} '23,26d' ${WRKSRC}/configure

post-install:
	@-${RM} ${STAGEDIR}${PREFIX}/info/dir

.include <bsd.port.mk>
