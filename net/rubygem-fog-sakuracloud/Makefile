PORTNAME=	fog-sakuracloud
PORTVERSION=	1.7.5
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support Sakura no Cloud
WWW=		https://github.com/fog/fog-sakuracloud

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-fog-json>=0:devel/rubygem-fog-json

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
