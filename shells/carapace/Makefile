PORTNAME=	carapace
DISTVERSIONPREFIX=	v
DISTVERSION=	1.8.0
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-shell multi-command argument completer
WWW=		https://carapace.sh/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/carapace-sh/carapace-bin
GO_TARGET=	./cmd/carapace
GO_BUILDFLAGS=	-ldflags="-w -X main.version=${DISTVERSION}"

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

pre-build:
	cd ${GO_WRKSRC} && \
	${SETENV} ${MAKE_ENV} ${GO_ENV} ${GO_CMD} generate ./cmd/...

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
