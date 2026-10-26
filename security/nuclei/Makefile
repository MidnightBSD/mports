PORTNAME=	nuclei
DISTVERSIONPREFIX=	v
DISTVERSION=	3.11.1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast vulnerability scanner
WWW=		https://github.com/projectdiscovery/nuclei

LICENSE=	mit

USES=		go:1.26,modules
GO_MODULE=	github.com/projectdiscovery/nuclei/v3

GO_TARGET=	./cmd/${PORTNAME}

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
