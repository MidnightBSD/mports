PORTNAME=	graphql
PORTVERSION=	2.5.11
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plain-Ruby implementation of GraphQL
WWW=		https://github.com/rmosolgo/graphql-ruby

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-base64>=0:converters/rubygem-base64 \
		rubygem-fiber-storage>=0:devel/rubygem-fiber-storage \
		rubygem-logger-gitlab>=0:devel/rubygem-logger-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
