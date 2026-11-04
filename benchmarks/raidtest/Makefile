PORTNAME=	raidtest
PORTVERSION=	1.3
CATEGORIES=	benchmarks
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test performance of storage devices

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		uidfix

PLIST_FILES=	bin/raidtest

PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

do-fetch:

do-extract:
	${MKDIR} ${WRKSRC}
	${LN} -sf ${FILESDIR}/${PORTNAME}.c ${FILESDIR}/Makefile ${WRKSRC}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${FILESDIR}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
