PORTNAME=	openssl-ccm
PORTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	security rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of RFC 3610 - Counter with CBC-MAC (CCM)
WWW=		https://github.com/SmallLars/openssl-ccm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-openssl>=3.0:security/rubygem-openssl

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
