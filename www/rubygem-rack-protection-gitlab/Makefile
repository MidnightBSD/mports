PORTNAME=	rack-protection
PORTVERSION=	3.2.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Rack middleware to protect against opportunistic attack
WWW=		https://sinatrarb.com/protection/ \
		https://github.com/sinatra/sinatra/tree/main/rack-protection

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-base64>=0.1.0:converters/rubygem-base64 \
		rubygem-rack-gitlab>=2.2.4<3:www/rubygem-rack-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
