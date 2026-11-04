PORTNAME=	gitea
DISTVERSIONPREFIX=	v
DISTVERSION=	28.2.0
CATEGORIES=	www
MASTER_SITES=	https://github.com/go-gitea/gitea/releases/download/${DISTVERSIONPREFIX}${DISTVERSION}/ \
		https://dl.gitea.io/gitea/${DISTVERSION}/
DISTNAME=	gitea-src-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact self-hosted Git service
WWW=		https://gitea.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	git:devel/git

USES=		cpe gmake go:1.27+,no_targets
USE_RC_SUBR=	gitea

# CVE-2026-111497: andybalholm/brotli before 1.2.7 mishandles invalid block
# switches.  Replace the vendored copy (v1.2.1) with the fixed release; see
# post-extract.
USE_GITHUB=	nodefault
GH_TUPLE=	andybalholm:brotli:v1.2.7:brotli

EXTRACT_AFTER_ARGS=	--strip-components 1 # since 1.17.0, archive includes gitea-src-VERSION directory
SUB_FILES+=	app.ini.sample pkg-message
SUB_LIST+=	GITUSER=${USERS}

NO_WRKSUBDIR=	yes

USERS=		git
GROUPS=		git

PORTDATA=	*

OPTIONS_DEFINE=	BINDATA GIT_LFS PAM SQLITE
OPTIONS_DEFAULT=	GIT_LFS PAM SQLITE
OPTIONS_SUB=	yes

BINDATA_DESC=	Build a single monolithic binary, with all assets included
GIT_LFS_DESC=	Support for Git Large File Storage (LFS)
PAM_DESC=	Enable support for PAM

BINDATA_VARS=	GO_TAGS+=bindata
GIT_LFS_RUN_DEPENDS=	git-lfs:devel/git-lfs
PAM_VARS=	GO_TAGS+=pam
SQLITE_VARS=	GO_TAGS+="sqlite sqlite_unlock_notify"

NO_TEST=	yes

.include <bsd.mport.options.mk>

DAEMONARGS=	-S -l \$${gitea_facility} -s \$${gitea_priority} -T \$${name}

SUB_LIST+=	DAEMONARGS="${DAEMONARGS}"

SSP_UNSAFE=	true
LDFLAGS+=	"'-X "gitea.dev/modules/setting.CustomPath=${PREFIX}/etc/gitea"'"
LDFLAGS+=	"'-X "gitea.dev/modules/setting.AppWorkPath=${PREFIX}/share/gitea"'"
# Default LDFLAGS are incompatible with build
MAKE_ENV=	LDFLAGS="${LDFLAGS} ${EXTRA_LDFLAGS}"
MAKE_ARGS=	GOPATH=${WRKDIR} TAGS="${GO_TAGS}" GOFLAGS="-buildvcs=false"
ALL_TARGET=	backend
MAKE_JOBS_UNSAFE=	yes

post-extract:
	${RM} -r ${WRKSRC}/vendor/github.com/andybalholm/brotli
	${MKDIR} ${WRKSRC}/vendor/github.com/andybalholm/brotli
	${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/${DISTFILE_brotli} \
		-C ${WRKSRC}/vendor/github.com/andybalholm/brotli \
		--strip-components 1 --exclude '*_test.go' \
		--exclude '*/corpus-test' --exclude '*/testdata' \
		--exclude '*/go.mod' --exclude '*/go.sum'
	${REINPLACE_CMD} -e 's|github.com/andybalholm/brotli v1\.2\.1|github.com/andybalholm/brotli v1.2.7|' \
		${WRKSRC}/go.mod ${WRKSRC}/vendor/modules.txt
	${REINPLACE_CMD} \
		-e 's|^github.com/andybalholm/brotli v1\.2\.1 h1:.*|github.com/andybalholm/brotli v1.2.7 h1:UgafRPGMam5ySHfRkhthMqOFA6IFoeF3D7mWIDLjG5A=|' \
		-e 's|^github.com/andybalholm/brotli v1\.2\.1/go.mod h1:.*|github.com/andybalholm/brotli v1.2.7/go.mod h1:rzTDkvFWvIrjDXZHkuS16NPggd91W3kUSvPlQ1pLaKY=|' \
		${WRKSRC}/go.sum

post-patch:
	${ECHO_CMD} ${DISTVERSION} >${WRKSRC}/VERSION

# Too lazy to figure out why go install won't work.
do-install:
	# Go binary is statically linked and cannot be stripped, so use
	# INSTALL_SCRIPT.
	${INSTALL_SCRIPT} ${WRKSRC}/gitea ${PREFIX}/sbin
	${MKDIR} ${ETCDIR}/conf \
		 ${DATADIR} \
		 ${FAKE_DESTDIR}/var/db/gitea \
		 ${FAKE_DESTDIR}/var/db/gitea/data \
		 ${FAKE_DESTDIR}/var/db/gitea/gitea-repositories \
		 ${FAKE_DESTDIR}/var/log/gitea
	${INSTALL_DATA} ${WRKDIR}/app.ini.sample ${ETCDIR}/conf/app.ini.sample
	${INSTALL_DATA} ${WRKSRC}/custom/conf/app.example.ini ${ETCDIR}/conf/app.ini.defaults

do-install-BINDATA-off:
	cd ${WRKSRC} && ${COPYTREE_SHARE} "options public templates" ${FAKE_DESTDIR}${DATADIR}

.include <bsd.port.mk>
