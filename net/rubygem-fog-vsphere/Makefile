PORTNAME=	fog-vsphere
PORTVERSION=	3.7.2
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Module for the 'fog' gem to support vSphere
WWW=		https://github.com/fog/fog-vsphere

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-rbvmomi2>=3.0<4:net/rubygem-rbvmomi2

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
