PORTNAME=	sprockets-rails
PORTVERSION=	3.5.2
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sprockets Rails integration
WWW=		https://github.com/rails/sprockets-rails

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/mit-LICENSE

RUN_DEPENDS=	rubygem-actionpack-gitlab>=5.2:www/rubygem-actionpack-gitlab \
		rubygem-activesupport-gitlab>=5.2:devel/rubygem-activesupport-gitlab \
		rubygem-sprockets-gitlab>=3.0.0:devel/rubygem-sprockets-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
