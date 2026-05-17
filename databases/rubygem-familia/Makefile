PORTNAME=	familia
PORTVERSION=	0.10.2
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Organize and store ruby objects in Redis
WWW=		https://github.com/delano/familia

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-gibbler>=1.0.0<1.1:devel/rubygem-gibbler \
		rubygem-multi_json>=1.15<2:devel/rubygem-multi_json \
		rubygem-redis>=4.8.1<6.0:databases/rubygem-redis \
		rubygem-storable>=0.10.0<0.11:devel/rubygem-storable \
		rubygem-uri-redis>=1.3<2:net/rubygem-uri-redis

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
