PORTNAME=	faraday-em_http
PORTVERSION=	2.0.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Faraday adapter for Em::Http
WWW=		https://github.com/lostisland/faraday-em_http

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-em-http-request>=1.1:www/rubygem-em-http-request \
		rubygem-faraday>=2.0<3:www/rubygem-faraday
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
