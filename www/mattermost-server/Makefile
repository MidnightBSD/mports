PORTNAME=	mattermost
DISTVERSIONPREFIX=	v
DISTVERSION=	10.11.25
PORTREVISION=	0
CATEGORIES=	www
PKGNAMESUFFIX=	-server

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source Slack-alternative in Golang and React
WWW=		https://mattermost.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/../LICENSE.txt

ONLY_FOR_ARCHS=	aarch64 amd64 armv6 armv7

RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss \
		mattermost-webapp>=${PORTVERSION}:www/mattermost-webapp

USES=		go:1.26+,modules
USE_GITHUB=	yes
USE_RC_SUBR=	mattermostd

GO_TARGET=	./cmd/mattermost ./cmd/mmctl ./scripts/config_generator
GO_BUILDFLAGS=	-ldflags=" \
		-X github.com/mattermost/mattermost/server/public/model.BuildNumber=${PORTVERSION} \
		-X github.com/mattermost/mattermost/server/public/model.BuildHashEnterprise=none \
		-X github.com/mattermost/mattermost/server/public/model.BuildEnterpriseReady=false"

WRKSRC_SUBDIR=	server
WWWDIR=		${PREFIX}/www/mattermost

MATTERMOSTD_USER=	mattermost
MATTERMOSTD_GROUP=	mattermost

USERS=		${MATTERMOSTD_USER}
GROUPS=		${MATTERMOSTD_GROUP}

NO_TEST=	yes

# The server is built as a Go workspace (server + server/public), as upstream
# does.  The module dependencies are downloaded into ${GO_GOPATH} at fetch
# time from the go.mod/go.sum files in the GitHub tarball and vendored offline
# after extraction (-e skips the private github.com/mattermost/enterprise
# packages, which are only imported with the "enterprise" build tag).
# CVE-2026-111497: github.com/andybalholm/brotli is raised to the fixed release.
MM_GO_FIX=	github.com/andybalholm/brotli@v1.2.7
MM_GO_ENV=	${SETENVI} ${WRK_ENV} ${GO_ENV} GOTOOLCHAIN=local
MM_GOMODS=	server/go.mod server/go.sum server/public/go.mod \
		server/public/go.sum

post-fetch:
	@${ECHO_MSG} "===> Fetching ${PORTNAME} Go module dependencies"
	@tmp=$$(${MKTEMP} -d -t ${PORTNAME}-gomod) && \
	${TAR} -xf ${DISTDIR}/${DISTFILES:[1]:C/:.*//} -C $${tmp} \
		--strip-components 1 \
		${MM_GOMODS:S|^|${WRKSRC:H:T}/|} && \
	(cd $${tmp}/server && \
	${MM_GO_ENV} GOPROXY=${GO_GOPROXY} ${GO_CMD} work init . ./public && \
	${MM_GO_ENV} GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x all && \
	${MM_GO_ENV} GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x ${MM_GO_FIX}); \
	rc=$$?; ${RM} -r $${tmp}; exit $${rc}

post-extract:
	@(cd ${GO_WRKSRC}; ${MM_GO_ENV} ${MAKE_ENV} GOPROXY=${GO_MODCACHE} \
		${GO_CMD} work init . ./public)
	@(cd ${GO_WRKSRC}; ${MM_GO_ENV} ${MAKE_ENV} GOPROXY=${GO_MODCACHE} \
		GONOSUMDB=${MM_GO_FIX:C/@.*//} ${GO_CMD} get ${MM_GO_FIX})
	@(cd ${GO_WRKSRC}; ${MM_GO_ENV} ${MAKE_ENV} GOPROXY=${GO_MODCACHE} \
		${GO_CMD} work vendor -e)

post-install:
	${MV} ${PREFIX}/bin/mattermost ${PREFIX}/bin/mattermostd
	${MKDIR} ${PREFIX}/etc/mattermost
	${SETENV} OUTPUT_CONFIG=${WRKSRC}/config/default.json ${WRKDIR}/bin/config_generator
	${INSTALL_DATA} ${WRKSRC}/config/default.json ${PREFIX}/etc/mattermost/config.json.sample
	${RM} ${PREFIX}/bin/config_generator
	${MKDIR} ${WWWDIR}/templates
	cd ${GO_WRKSRC} && ${COPYTREE_SHARE} 'fonts i18n' ${WWWDIR}
	cd ${GO_WRKSRC}/templates && ${CP} *.html *.js ${WWWDIR}/templates

.include <bsd.port.mk>
