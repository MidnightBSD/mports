PORTNAME=	gruff
PORTVERSION=	0.27.0
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beautiful graphing library for Ruby using RMagick
WWW=		https://github.com/topfunky/gruff

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-bigdecimal>=3.0:math/rubygem-bigdecimal \
		rubygem-histogram>=0:graphics/rubygem-histogram \
		rubygem-rmagick>=5.5:graphics/rubygem-rmagick

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
