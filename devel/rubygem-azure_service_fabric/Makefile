PORTNAME=	azure_service_fabric
PORTVERSION=	0.18.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft Azure Service Fabric Client Library for Ruby
WWW=		https://github.com/Azure/azure-sdk-for-ruby/tree/master/data/azure_service_fabric

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	rubygem-ms_rest_azure>=0.12.0<0.13:devel/rubygem-ms_rest_azure
RUN_DEPENDS=	rubygem-ms_rest_azure>=0.12.0<0.13:devel/rubygem-ms_rest_azure

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
