PORTNAME=	apollo_upload_server
PORTVERSION=	2.1.6
PORTREVISION=	1
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apollo-upload-server middleware for rails
WWW=		https://github.com/jetruby/apollo_upload_server-ruby

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack-gitlab>=6.1.6:www/rubygem-actionpack-gitlab \
		rubygem-graphql>=1.8:devel/rubygem-graphql

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
