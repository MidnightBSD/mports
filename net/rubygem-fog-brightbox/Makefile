PORTNAME=	fog-brightbox
PORTVERSION=	1.12.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Module for the 'fog' gem to support Brightbox Cloud
WWW=		https://github.com/fog/fog-brightbox

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-dry-inflector>=0:devel/rubygem-dry-inflector \
		rubygem-fog-core>=1.45<3.0:devel/rubygem-fog-core \
		rubygem-fog-json>=0:devel/rubygem-fog-json

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
