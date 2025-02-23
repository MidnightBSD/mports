PORTNAME=	tinycdb
PORTVERSION=	0.81
CATEGORIES=	databases
MASTER_SITES=	http://www.corpit.ru/mjt/tinycdb/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analogous to cdb, but faster
WWW=		https://www.corpit.ru/mjt/tinycdb.html

LICENSE=	publicdom

USES=		gmake
USE_LDCONFIG=	yes
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" prefix="${PREFIX}" \
		mandir=${PREFIX}/share/man \
		pkgconfdir=${PREFIX}/libdata/pkgconfig \

ALL_TARGET=	static sharedlib
INSTALL_TARGET=	install install-sharedlib

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/cdb ${STAGEDIR}${PREFIX}/lib/libcdb.so.1

.include <bsd.port.mk>
