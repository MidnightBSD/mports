PORTNAME=	async-rest
PORTVERSION=	0.20.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RESTful clients (and hopefully servers)
WWW=		https://socketry.github.io/async-rest/ \
		https://github.com/socketry/async-rest

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-async-http>=0.42<1:www/rubygem-async-http \
		rubygem-protocol-url>=0.2<1:www/rubygem-protocol-url

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
