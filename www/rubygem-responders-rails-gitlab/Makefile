PORTNAME=	responders
PORTVERSION=	3.1.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Ruby DSL for making HTTP requests
WWW=		https://github.com/heartcombo/responders

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-actionpack-gitlab>=5.2:www/rubygem-actionpack-gitlab \
		rubygem-railties-gitlab>=5.2:www/rubygem-railties-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
