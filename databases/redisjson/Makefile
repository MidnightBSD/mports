PORTNAME=	redisjson
DISTVERSIONPREFIX=	v
DISTVERSION=	8.10.0
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON data type for Redis
WWW=		https://redis.io/docs/latest/develop/data-types/json/

LICENSE=	AGPLv3 RSALv2 SSPLv1
LICENSE_COMB=	dual
LICENSE_NAME_AGPLv3=	GNU Affero General Public License version 3
LICENSE_NAME_RSALv2=	Redis Source Available License v2
LICENSE_NAME_SSPLv1=	Server Side Public License v1
LICENSE_FILE=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_AGPLv3=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_RSALv2=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_SSPLv1=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

NOT_FOR_ARCHS=	i386
NOT_FOR_ARCHS_REASON=	Requires 64-bit architecture

BUILD_DEPENDS=	${LOCALBASE}/llvm${LLVM_DEFAULT}/lib/libclang.so:devel/llvm${LLVM_DEFAULT}

USES=		cargo
USE_GITHUB=	yes
GH_ACCOUNT=	RedisJSON
GH_PROJECT=	RedisJSON

PLIST_FILES=	lib/librejson.so

# Redis refuses to load modules without the execute bit.
do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/librejson.so ${PREFIX}/lib

.include <bsd.port.mk>
