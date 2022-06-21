PORTNAME=	libublio
PORTVERSION=	20070103
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/mandree

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User space caching library

LICENSE=	bsd3

USES=		uidfix
USE_LDCONFIG=	yes

FAKE_OPTS=	trueprefix

SUB_FILES=    libublio.pc
SUB_LIST=     PREFIX=${TRUE_PREFIX} PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	DOCS

post-extract:
	@${CP} ${FILESDIR}/${MAKEFILE} ${WRKSRC}

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/libublio.pc ${STAGEDIR}${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
