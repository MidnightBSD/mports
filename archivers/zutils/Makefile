PORTNAME=	zutils
PORTVERSION=	1.13
CATEGORIES=	archivers
MASTER_SITES=	SAVANNAH/zutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for searching in bzip2, gzip, lzip, and xz archives
WWW=		https://www.nongnu.org/zutils/zutils.html

LICENSE=	gpl2

USES=		cpe tar:lz
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share

CONFLICTS_INSTALL=	gzip # bin/zcat bin/zcmp bin/zdiff bin/zgrep share/man/man1/ztest.1.gz

INSTALL_TARGET=	install-strip
CPE_VENDOR=	nongnu

INFO=		zutils

post-patch:
	# Remove compiler hardcoded flags and use environment
	@${REINPLACE_CMD} '23,26d' ${WRKSRC}/configure

post-install:
	@-${RM} ${STAGEDIR}${PREFIX}/info/dir

.include <bsd.port.mk>
