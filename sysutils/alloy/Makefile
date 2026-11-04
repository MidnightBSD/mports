PORTNAME=	alloy
DISTVERSIONPREFIX=	v
DISTVERSION=	1.21.2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenTelemetry Collector distribution with programmable pipelines
WWW=		https://github.com/grafana/alloy

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libelf.so:devel/elfutils

# no_targets: we supply do-build/do-install for the collector submodule.
USES=		go:1.27,modules,no_targets

USE_GITHUB=	yes
GH_ACCOUNT=	grafana

# Fetch go.mod from GitHub rather than GOPROXY so the framework does not
# also download a GOPROXY zip, which would conflict with the GitHub tarball
# WRKSRC.  With GO_MOD_DIST=github, go.mk skips the GOPROXY zip and leaves
# WRKSRC set correctly by USE_GITHUB.
GO_MOD_DIST=	github

USE_RC_SUBR=	${PORTNAME}

GO_MODULE=	github.com/${GH_ACCOUNT}/${GH_PROJECT}
GO_BUILDFLAGS=	-ldflags='-X github.com/grafana/alloy/internal/build.Version=${GH_TAGNAME}'

# CVE-2026-111497: andybalholm/brotli before 1.2.7 mishandles invalid block
# switches. Fetch the fixed module and require it in collector/ (the module
# the binary is built from) before it is vendored. The module cache entry is
# checked against GOSUMDB at fetch time, so the extract step can trust it
# offline.
GO_BROTLI_FIX=	github.com/andybalholm/brotli@v1.2.7

# The main go.mod has "replace ./syntax => ./syntax".  go-post-fetch (800)
# runs go mod download from DIST_SUBDIR and needs syntax/go.mod present.
# post-fetch runs at priority 700, after do-fetch (500) downloads the tarball.
post-fetch:
	@(cd ${DISTDIR}/${DIST_SUBDIR}; [ -e syntax/go.mod ] || (\
		${MKDIR} syntax; \
		${TAR} -xzf ${DISTNAME}${EXTRACT_SUFX} ${PORTNAME}-${DISTVERSION}/syntax/go.mod; \
		${CP} ${PORTNAME}-${DISTVERSION}/syntax/go.mod syntax/go.mod))
	@(cd ${DISTDIR}/${DIST_SUBDIR}; ${SETENVI} ${WRK_ENV} ${GO_ENV} \
		GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x ${GO_BROTLI_FIX})

# collector/ is a separate Go module with its own dependencies.  Download
# them at fetch time; extract has no network access in poudriere.
_USES_fetch+=	900:alloy-fetch-collector-deps
alloy-fetch-collector-deps:
	@${ECHO_MSG} "===> Fetching collector submodule dependencies"; \
	td=$$(mktemp -d -t alloy_collector_deps); \
	trap "${RM} -r $$td" 0; \
	${TAR} -xzf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} -C $$td; \
	(cd $$td/${PORTNAME}-${DISTVERSION}/collector && \
		${SETENVI} ${WRK_ENV} GOPATH="${GO_GOPATH}" GO111MODULE=on GOFLAGS=-modcacherw GOSUMDB=sum.golang.org \
		GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x all); \
	${RM} -r $$td

# After go-post-extract (800) vendors the main module, vendor collector/
# using the module cache populated above.
_USES_extract+=	900:alloy-vendor-collector
alloy-vendor-collector:
	@${ECHO_MSG} "===> Vendoring collector submodule"; \
	(cd ${WRKSRC}/collector && \
		${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=${GO_MODCACHE} \
		GONOSUMDB=${GO_BROTLI_FIX:C/@.*//} ${GO_CMD} get ${GO_BROTLI_FIX} && \
		${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=${GO_MODCACHE} \
		${GO_CMD} mod vendor -e)

# The alloy binary lives in collector/, a separate Go module.
do-build:
	(cd ${WRKSRC}/collector; \
		${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} GOMAXPROCS=${MAKE_JOBS_NUMBER} GOPROXY=off \
		${GO_CMD} build ${GO_BUILDFLAGS} -mod=vendor -o ${GO_WRKDIR_BIN}/alloy .)

do-install:
	${INSTALL_PROGRAM} ${GO_WRKDIR_BIN}/alloy ${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/example-config.alloy ${PREFIX}/etc/alloy.flow.sample
	${MKDIR} ${FAKE_DESTDIR}/var/${PORTNAME}

.include <bsd.port.mk>
