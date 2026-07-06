PORTNAME=	signet
PORTVERSION=	0.21.0
CATEGORIES=	security rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OAuth 1.0 / OAuth 2.0 implementation
WWW=		https://github.com/google/signet

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-addressable>=2.8<3:www/rubygem-addressable \
		rubygem-faraday>=0.17.5<3.0:www/rubygem-faraday \
		rubygem-jwt>=1.5<4.0:www/rubygem-jwt \
		rubygem-multi_json>=1.10<2:devel/rubygem-multi_json
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
