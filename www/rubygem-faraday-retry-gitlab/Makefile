PORTNAME=	faraday-retry
PORTVERSION=	2.3.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Catch exceptions and retries each request a limited number of times
WWW=		https://github.com/lostisland/faraday-retry

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-faraday-gitlab>=2.0<3:www/rubygem-faraday-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
