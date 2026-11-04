PORTNAME=	faraday-cookie_jar
PORTVERSION=	0.0.8
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cookie jar middleware for Faraday
WWW=		https://github.com/miyagawa/faraday-cookie_jar

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-faraday1>=0.8.0:www/rubygem-faraday1 \
		rubygem-http-cookie>=1.0.0:www/rubygem-http-cookie

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
