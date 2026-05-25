PORTNAME=	fog-cloudatcost
PORTVERSION=	0.4.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support CloudAtCost
WWW=		https://github.com/fog/fog-cloudatcost

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-fog-json>=0:devel/rubygem-fog-json \
		rubygem-ipaddress>=0:net/rubygem-ipaddress

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
