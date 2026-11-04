PORTNAME=	hiredis
DISTVERSIONPREFIX=	v
DISTVERSION=	1.2.0-15
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimalistic C client library for the Redis database
WWW=		https://github.com/redis/hiredis

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	redis
GH_TAGNAME=	7ab6b82

USES=		cpe cmake pathfix ssl
USE_LDCONFIG=	yes

CPE_VENDOR=	redislabs

CMAKE_OFF=    ENABLE_NUGET
CMAKE_ON=     DISABLE_TESTS ENABLE_SSL

NO_TEST=	yes

.include <bsd.port.mk>
