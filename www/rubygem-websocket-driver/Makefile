PORTNAME=	websocket-driver
PORTVERSION=	0.8.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebSocket protocol handler with pluggable I/O
WWW=		https://github.com/faye/websocket-driver-ruby

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-base64>=0:converters/rubygem-base64 \
		rubygem-websocket-extensions>=0.1.0:www/rubygem-websocket-extensions

USES=		gem

.include <bsd.port.mk>
