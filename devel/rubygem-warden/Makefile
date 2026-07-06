PORTNAME=	warden
PORTVERSION=	1.2.9
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rack middleware that provides authentication for rack applications
WWW=		https://github.com/wardencommunity/warden

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-rack>=2.0.9,3:www/rubygem-rack
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
