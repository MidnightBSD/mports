PORTNAME=	fog-vmfusion
PORTVERSION=	0.1.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support VMware Fusion
WWW=		https://github.com/fog/fog-vmfusion

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fission>=0:emulators/rubygem-fission \
		rubygem-fog-core>=0:devel/rubygem-fog-core

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
