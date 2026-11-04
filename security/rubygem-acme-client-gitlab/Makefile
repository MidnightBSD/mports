PORTNAME=	acme-client
PORTVERSION=	2.0.31
CATEGORIES=	security rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for the ACME protocol
WWW=		https://github.com/unixcharles/acme-client

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-base64>=0.2<1:converters/rubygem-base64 \
		rubygem-faraday-gitlab>=1.0<3.0.0:www/rubygem-faraday-gitlab \
		rubygem-faraday-retry-gitlab>=1.0<3.0.0:www/rubygem-faraday-retry-gitlab
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem shebangfix

SHEBANG_FILES=	bin/setup

NO_ARCH=	yes

.include <bsd.port.mk>
