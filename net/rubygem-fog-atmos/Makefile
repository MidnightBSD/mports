PORTNAME=	fog-atmos
PORTVERSION=	0.1.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support Atmos Cloud Storage
WWW=		https://github.com/fog/fog-atmos

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-fog-xml>=0:textproc/rubygem-fog-xml

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
