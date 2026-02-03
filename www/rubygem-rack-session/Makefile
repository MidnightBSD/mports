PORTNAME=	rack-session
PORTVERSION=	2.1.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session implementation for Rack
WWW=		https://github.com/rack/rack-session

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

RUN_DEPENDS=	rubygem-base64>=0.1.0:converters/rubygem-base64 \
		rubygem-rack>=3.0.0,3:www/rubygem-rack
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
