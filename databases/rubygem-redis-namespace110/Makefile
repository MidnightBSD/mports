PORTNAME=	redis-namespace
PORTVERSION=	1.10.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	110

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby client class for Redis with namespace support
WWW=		https://github.com/resque/redis-namespace

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-redis>=4:databases/rubygem-redis

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^1\.10\.

.include <bsd.port.mk>
