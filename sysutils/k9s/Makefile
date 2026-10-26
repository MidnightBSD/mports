PORTNAME=	k9s
DISTVERSIONPREFIX=	v
DISTVERSION=	0.51.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kubernetes command-line tool
WWW=		https://github.com/derailed/k9s

LICENSE=	Apache-2.0

NOT_FOR_ARCHS=	i386

USES=		go:1.25+,modules
GO_MODULE=	github.com/derailed/k9s
GO_BUILDFLAGS=	-ldflags="-X github.com/derailed/k9s/cmd.version=${DISTVERSIONFULL} \
		-X github.com/derailed/k9s/cmd.date=$$(date +'%Y-%m-%dT%H:%M:%SZ') \
		-X github.com/derailed/k9s/cmd.commit=558caafe7ba067467de46b320cc22ef11fef9c34"

# CVE-2026-111497: andybalholm/brotli before 1.2.7 mishandles invalid block
# switches. Fetch the fixed module and require it before go-post-extract
# tidies and vendors the dependencies. The module cache entry is checked
# against GOSUMDB at fetch time, so the extract step can trust it offline.
GO_BROTLI_FIX=	github.com/andybalholm/brotli@v1.2.7

PLIST_FILES=	bin/${PORTNAME}

NO_TEST=	yes

post-fetch:
	@(cd ${DISTDIR}/${DIST_SUBDIR}; ${SETENVI} ${WRK_ENV} ${GO_ENV} \
		GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x ${GO_BROTLI_FIX})

post-extract:
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		GOPROXY=${GO_MODCACHE} GONOSUMDB=${GO_BROTLI_FIX:C/@.*//} \
		${GO_CMD} get ${GO_BROTLI_FIX})

.include <bsd.port.mk>
