PORTNAME=	lemon
PORTVERSION=	3.34
CATEGORIES=	devel
MASTER_SITES=	http://tx97.net/pub/distfiles/ \
		https://bsdforge.com/projects/source/devel/lemon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LALR(1) parser generator. Similar in function to yacc and bison
WWW=		https://www.hwaci.com/sw/lemon/

LICENSE=	publicdom

USES=		tar:bzip2
MAKEFILE=	/dev/null
ALL_TARGET=	${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|toFree = tpltname = pathsearch(.*|tpltname = "${DATADIR}/lempar.c";|' \
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
