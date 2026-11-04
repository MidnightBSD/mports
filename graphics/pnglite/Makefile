PORTNAME=	pnglite
PORTVERSION=	0.1.17
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight PNG C library
WWW=		https://sourceforge.net/projects/pnglite/

LICENSE=	zlib

USES=		dos2unix zip
USE_LDCONFIG=	yes
SOVERSION=	0

LDFLAGS+=	-fPIC -Wl,-soname,libpnglite.so.${SOVERSION}

NO_WRKSUBDIR=	yes

PLIST_FILES=	include/pnglite.h lib/libpnglite.so lib/libpnglite.so.${SOVERSION}

do-build:
	cd ${WRKSRC} && ${CC} ${CFLAGS} ${LDFLAGS} -shared pnglite.c -o libpnglite.so.${SOVERSION}

do-install:
	@${MKDIR} ${PREFIX}/include ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/pnglite.h ${PREFIX}/include
	${INSTALL_LIB} ${WRKSRC}/libpnglite.so.${SOVERSION} ${PREFIX}/lib
	${LN} -s libpnglite.so.${SOVERSION} ${PREFIX}/lib/libpnglite.so

.include <bsd.port.mk>
