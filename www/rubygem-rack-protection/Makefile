PORTNAME=	rack-protection
PORTVERSION=	4.1.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Rack middleware to protect against opportunistic attack
WWW=		https://sinatrarb.com/protection/ \
		https://github.com/sinatra/sinatra/tree/main/rack-protection

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License

RUN_DEPENDS=	rubygem-base64>=0.1.0:converters/rubygem-base64 \
		rubygem-logger>=1.6.0:devel/rubygem-logger \
		rubygem-rack>=3.0.0,3<4,3:www/rubygem-rack
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
