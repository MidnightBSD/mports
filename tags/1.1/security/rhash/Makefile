# $MidnightBSD$

PORTNAME=	rhash
PORTVERSION=	1.3.5
CATEGORIES=	security
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility and library for computing and checking of file hashes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS+=	trueprefix

USE_LDCONFIG=	yes
MAKE_ARGS=	INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_SHARED="${INSTALL_PROGRAM}" \
		MANDIR="${PREFIX}/man"
ALL_TARGET=	build-shared
INSTALL_TARGET=	install-shared install-lib-static install-lib-shared

WRKSRC=		${WRKDIR}/RHash-${PORTVERSION}

PORTDOCS=	ChangeLog README

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,/etc/,${TRUE_PREFIX}&,' ${WRKSRC}/parse_cmdline.c
	@${REINPLACE_CMD} -e '/BYTE_ORDER/s,__,_,g' \
		${WRKSRC}/librhash/byte_order.h

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

do-test:
	cd ${WRKSRC}/tests && ${SH} test_rhash.sh --full

.include <bsd.port.mk>
