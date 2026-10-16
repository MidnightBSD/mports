PORTNAME=	osv-scanner
DISTVERSIONPREFIX=	v
DISTVERSION=	2.5.1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vulnerability scanner written in Go which uses the OSV database
WWW=		https://github.com/google/osv-scanner

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.26,modules,run

NOT_FOR_ARCHS=	armv6 armv7 i386

_BUILD_COMMIT=	c84fa45
_BUILD_DATE=	$$(date +%Y-%m-%d)

GO_MODULE=	github.com/google/${PORTNAME}/v2
GO_TARGET=	./cmd/${PORTNAME}
GO_BUILDFLAGS=	-ldflags "\
		-s -w \
		-X ${GO_MODULE}/cmd/${PORTNAME}/internal/cmd.date=${_BUILD_DATE} \
		-X ${GO_MODULE}/cmd/${PORTNAME}/internal/cmd.commit=${_BUILD_COMMIT}"

PLIST_FILES=	${GO_TARGET:C/.\/cmd/bin/}
PORTDOCS=	CHANGELOG.md CONTRIBUTING.md README.md

OPTIONS_DEFINE=	DOCS

.if defined(MAGUS)
NO_TEST=	yes
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,%%GO_SUFFIX%%,${GO_SUFFIX},' \
		${WRKSRC}/internal/sourceanalysis/go.go

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
