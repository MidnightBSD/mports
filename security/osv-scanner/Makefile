PORTNAME=	osv-scanner
DISTVERSIONPREFIX=	v
DISTVERSION=	1.9.2
PORTREVISION=	2
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vulnerability scanner written in Go which uses the OSV database
WWW=		https://github.com/google/osv-scanner

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.23,modules

_BUILD_VERSION=	${DISTVERSION}
_BUILD_COMMIT=	1e295ee
_BUILD_DATE=	$$(date +%Y-%m-%d)

GO_MODULE=	github.com/google/${PORTNAME}
GO_TARGET=	./cmd/${PORTNAME}
GO_BUILDFLAGS=	-ldflags "\
		-s -w \
		-X main.version=${_BUILD_VERSION} \
		-X main.date=${_BUILD_DATE} \
		-X main.commit=${_BUILD_COMMIT}"

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
