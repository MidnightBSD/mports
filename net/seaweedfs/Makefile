PORTNAME=	seaweedfs
DISTVERSION=	4.51
CATEGORIES=	net sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed Object Store and Filesystem
WWW=		https://github.com/seaweedfs/seaweedfs/wiki

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.26,modules

USE_RC_SUBR=	seaweedfs

GO_MODULE=	github.com/seaweedfs/seaweedfs@v0.0.0-20261025193907-153ab668c997
GO_TARGET=	./weed
CGO_CFLAGS=	-I.

# CVE-2026-111497: andybalholm/brotli before 1.2.7 mishandles invalid block
# switches. Fetch the fixed module and require it before go-post-extract
# tidies and vendors the dependencies. The module cache entry is checked
# against GOSUMDB at fetch time, so the extract step can trust it offline.
GO_BROTLI_FIX=	github.com/andybalholm/brotli@v1.2.7

SEAWEEDFS_DIR?=		/var/db/${PORTNAME}
SEAWEEDFS_USER?=	seaweedfs
SEAWEEDFS_GROUP?=	seaweedfs

SUB_FILES=	pkg-message
SUB_LIST=	SEAWEEDFS_DIR=${SEAWEEDFS_DIR} \
		USER=${SEAWEEDFS_USER} \
		GROUP=${SEAWEEDFS_GROUP}

USERS=		${SEAWEEDFS_USER}
GROUPS=		${SEAWEEDFS_GROUP}

OPTIONS_DEFINE=		GOCDK RCLONE
OPTIONS_DEFAULT=	ELASTIC GOCDK RCLONE SQLITE
OPTIONS_GROUP=		FILERS
OPTIONS_GROUP_FILERS=	ELASTIC SQLITE TIKV YDB

ELASTIC_DESC=	Elasticsearch support
FILERS_DESC=	Filer store engines
GOCDK_DESC=	Go CDK PubSub API support
RCLONE_DESC=	rsync for cloud storage backend
TIKV_DESC=	TiKV database support
YDB_DESC=	YDB support

ELASTIC_VARS=	GO_TAGS+=elastic
GOCDK_VARS=	GO_TAGS+=gocdk
RCLONE_VARS=	GO_TAGS+=rclone
SQLITE_VARS=	GO_TAGS+=sqlite
TIKV_VARS=	GO_TAGS+=tikv
YDB_VARS=	GO_TAGS+=ydb

# too hard to run in magus chroot
NO_TEST=	yes

.include <bsd.port.pre.mk>
.if !empty (GO_TAGS)
GO_BUILDFLAGS+=	-tags "${GO_TAGS}"
.endif

post-fetch:
	@(cd ${DISTDIR}/${DIST_SUBDIR}; ${SETENVI} ${WRK_ENV} ${GO_ENV} \
		GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x ${GO_BROTLI_FIX})

post-extract:
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		GOPROXY=${GO_MODCACHE} GONOSUMDB=${GO_BROTLI_FIX:C/@.*//} \
		${GO_CMD} get ${GO_BROTLI_FIX})

post-build:
.for cfg in master filer security replication notification
	${WRKDIR}/bin/weed scaffold -config ${cfg} -output ${WRKDIR}/
.endfor

post-install:
	${MKDIR} ${ETCDIR}
.for cfg in filer master notification replication security
	${INSTALL_DATA} ${WRKDIR}/${cfg}.toml \
		${ETCDIR}/${cfg}.toml.sample
.endfor

.include <bsd.port.post.mk>
