PORTNAME=	redis-clustering
PORTVERSION=	5.4.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby client that tries to match Redis Cluster API
WWW=		https://github.com/redis/redis-rb/tree/master/cluster

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-redis>=${PORTVERSION}:databases/rubygem-redis \
		rubygem-redis-cluster-client>=0.10.0:databases/rubygem-redis-cluster-client

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
