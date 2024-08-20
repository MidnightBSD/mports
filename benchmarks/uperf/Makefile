PORTNAME=	uperf
DISTVERSION=	1.0.7
PORTEPOCH=	1
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network performance tool to model and replay of networking patterns
WWW=		https://uperf.org/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		ssl
USE_GITHUB=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--datadir=${DATADIR}/workloads
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${DATADIR}/tests
	(cd ${WRKSRC}/tests && \
	${COPYTREE_SHARE} . ${DATADIR}/tests \
	"! -name Makefile.in ! -name Makefile.am ! -name Makefile")

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in AUTHORS README.md
	${INSTALL_DATA} ${WRKSRC}/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/docs
	(cd ${WRKSRC}/docs && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/docs "! -name CNAME")
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/manual
	(cd ${WRKSRC}/manual && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/manual "! -name Makefile")

.include <bsd.port.mk>
