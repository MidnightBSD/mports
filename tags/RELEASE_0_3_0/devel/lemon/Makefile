# $MidnightBSD$

PORTNAME=	lemon
PORTVERSION=	1.69
CATEGORIES=	devel
MASTER_SITES=	http://tx97.net/pub/distfiles/ \
		http://mirror.amdmi3.ru/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An LALR(1) parser generator. Similar in function to yacc and bison
LICENSE=	publicdom

USE_BZIP2=	yes

post-patch:
	${REINPLACE_CMD} -e 's| = pathsearch(.*| = "${DATADIR}/lempar.c";|' \
		${WRKSRC}/lemon.c

do-build:
	cd ${WRKSRC} && ${MAKE} PROG=lemon NOMAN=1 NO_MAN=1 \
		CFLAGS="-g ${CFLAGS}" \
		-f /usr/share/mk/bsd.prog.mk

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lemon ${PREFIX}/bin/
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/lempar.c ${DATADIR}/

.include <bsd.port.mk>
