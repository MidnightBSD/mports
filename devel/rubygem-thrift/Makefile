PORTNAME=	thrift
PORTVERSION=	${THRIFT_PORTVERSION} # to keep in sync with ../thrift
PORTEPOCH=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to thrift
WWW=		https://thrift.apache.org/

LICENSE=	Apache-2.0

USES=		cpe gem
CPE_VENDOR=	apache

# Workaround for stage-qa:
post-install:
	${FIND} ${STAGEDIR}${PREFIX}/${GEMS_BASE_DIR}/ -name '*.o' -o -name '*.so' | ${XARGS} ${STRIP_CMD}

.include "../thrift/bsd.thrift.mk"
LICENSE=	Apache-2.0
.include <bsd.port.mk>
