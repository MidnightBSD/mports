PORTNAME=	jquery-rails
PORTVERSION=	4.6.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides a Rails generator for jQuery
WWW=		https://github.com/rails/jquery-rails

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-rails-dom-testing>=1<3:textproc/rubygem-rails-dom-testing \
		rubygem-railties4>=4.2.0:www/rubygem-railties4 \
		rubygem-thor>=0.14<2.0:devel/rubygem-thor

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	rubyonrails

.include <bsd.port.mk>
