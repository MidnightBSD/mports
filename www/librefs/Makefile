PORTNAME=	librefs
DISTVERSION=	${GH_TAGNAME:S/RELEASE.//:S/Z//:S/T/-/:S/-/./g}
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Community maintained S3 compatible object storage server
WWW=		https://github.com/libreFS/libreFS

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler go:modules,1.26+

USE_GITHUB=	yes
GH_ACCOUNT=	libreFS
GH_PROJECT=	libreFS
GH_TAGNAME=	RELEASE.2026-05-04T00-42-47Z
USE_RC_SUBR=	${PORTNAME}

COMMIT_ID=	e194bd779f36fdc08f310d2819d9356f0c1f991b

# libreFS is a fork of MinIO and keeps the upstream "github.com/minio/minio"
# module path, so the sources come from GitHub while go.mod drives the module
# cache.
GO_MOD_DIST=	github
GO_MODULE=	github.com/minio/minio@${GH_TAGNAME}
GO_BUILDFLAGS=	-ldflags=' \
		-X github.com/minio/minio/cmd.Version=${GH_TAGNAME:C/RELEASE\.//:C|(..)-(..)-(..)Z|\1:\2:\3Z|} \
		-X github.com/minio/minio/cmd.ReleaseTag=${GH_TAGNAME} \
		-X github.com/minio/minio/cmd.CommitID=${COMMIT_ID} \
		-X github.com/minio/minio/cmd.ShortCommitID=${COMMIT_ID:C|(............).*|\1|} \
		-X github.com/minio/minio/cmd.GOPATH=${WRKSRC} ${STRIP} -w'

SUB_LIST=	DBDIR=${LIBREFS_DBDIR} \
		GROUP="${GROUPS}" \
		USER="${USERS}"

USERS=		${LIBREFS_USER}
GROUPS=		${LIBREFS_GROUP}

PLIST_FILES=	bin/${PORTNAME}

LIBREFS_USER?=	${PORTNAME}
LIBREFS_GROUP?=	${PORTNAME}
LIBREFS_DBDIR?=	/var/db/${PORTNAME}

NO_TEST=	yes

.include <bsd.port.mk>
