PORTNAME=	jwt
PORTVERSION=	2.10.2
CATEGORIES=	www devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Web Token implementation in Ruby
WWW=		https://github.com/jwt/ruby-jwt

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-base64>=0:converters/rubygem-base64

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^2\.

.include <bsd.port.mk>
