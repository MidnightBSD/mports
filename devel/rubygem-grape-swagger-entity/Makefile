PORTNAME=	grape-swagger-entity
PORTVERSION=	0.7.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Grape-entity object parsing
WWW=		https://github.com/ruby-grape/grape-swagger-entity

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-grape-entity>=1,1<2,1:devel/rubygem-grape-entity \
		rubygem-grape-swagger-gitlab>=2<3:devel/rubygem-grape-swagger-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
