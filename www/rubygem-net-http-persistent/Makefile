PORTNAME=	net-http-persistent
PORTVERSION=	4.0.7
CATEGORIES=	www net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manages persistent connections using Net::HTTP
WWW=		https://github.com/drbrain/net-http-persistent

LICENSE=	mit

RUN_DEPENDS=	rubygem-cgi>=0.5.1<0.6:www/rubygem-cgi \
		rubygem-connection_pool>=2.2.4<4:net/rubygem-connection_pool
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
