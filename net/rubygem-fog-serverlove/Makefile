PORTNAME=	fog-serverlove
PORTVERSION=	0.1.2
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support ServerLove
WWW=		https://github.com/fog/fog-serverlove

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-fog-json>=0:devel/rubygem-fog-json

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
