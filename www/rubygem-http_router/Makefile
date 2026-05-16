PORTNAME=	http_router
PORTVERSION=	0.11.2
PORTREVISION=	2
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	HTTP router for use in Rack
WWW=		https://github.com/joshbuddy/http_router

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-rack>=1.0.0,3:www/rubygem-rack \
		rubygem-url_mount>=0.2.1<0.3:www/rubygem-url_mount

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
