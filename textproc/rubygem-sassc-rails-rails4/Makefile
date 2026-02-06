PORTNAME=	sassc-rails
PORTVERSION=	2.1.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrate SassC-Ruby into Rails
WWW=		https://github.com/sass/sassc-rails

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-railties4>=4.0.0:www/rubygem-railties4 \
		rubygem-sassc>=2.0:textproc/rubygem-sassc \
		rubygem-sprockets-rails-rails4>=0:devel/rubygem-sprockets-rails-rails4 \
		rubygem-sprockets3>=3.0:devel/rubygem-sprockets3 \
		rubygem-tilt>=0:devel/rubygem-tilt
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
