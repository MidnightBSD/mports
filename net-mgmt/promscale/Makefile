PORTNAME=	promscale
DISTVERSION=	0.17.0
PORTREVISION=	6
CATEGORIES=	net-mgmt
MASTER_SITES=   https://raw.githubusercontent.com/${GH_ACCOUNT}/${GH_PROJECT}/${DISTVERSIONFULL}/:gomod
DISTFILES=      go.mod:gomod

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Timescale analytical platform for Prometheus metrics
WWW=		https://www.timescale.com/promscale

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_RC_SUBR?=	${PORTNAME}

USERS=          promscale
GROUPS=         ${USERS}

SUB_LIST?=	USERS=${USERS} GROUPS=${GROUPS}

USE_GITHUB=	yes
GH_ACCOUNT=	timescale
GH_PROJECT=	promscale

GO_MODULE=	github.com/timescale/promscale
GO_TARGET=	./cmd/promscale

PLIST_FILES=	bin/promscale

NO_TEST=	yes

.include <bsd.port.mk>
