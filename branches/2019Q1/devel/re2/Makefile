# $MidnightBSD$ 

PORTNAME=	re2
PORTVERSION=	20150601
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast C++ regex library

LICENSE=	bsd3

MAKE_ARGS=	CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" prefix=${PREFIX}
USE_LDCONFIG=	yes
USES=		gmake pathfix tar:tgz

GH_ACCOUNT=	google
GH_TAGNAME=	${PORTVERSION:C|(....)(..)(..)|\1-\2-\3|}
USE_GITHUB=	yes

WRKSRC=		${WRKDIR}/re2-2015-06-01

.include <bsd.port.pre.mk>

USES+=		compiler:c++11-lang

post-build:
	@${STRIP_CMD} ${WRKSRC}/obj/so/libre2.so

.include <bsd.port.post.mk>
