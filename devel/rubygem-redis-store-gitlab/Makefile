PORTNAME=	redis-store
PORTVERSION=	1.11.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Namespaced Redis stores for Ruby web frameworks
WWW=		https://redis-store.org/redis-store/ \
		https://github.com/redis-store/redis-store

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-redis-gitlab>=4<6:databases/rubygem-redis-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
