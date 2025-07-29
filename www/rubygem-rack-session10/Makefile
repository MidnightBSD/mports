PORTNAME=	rack-session
PORTVERSION=	1.0.2
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session implementation for Rack
WWW=		https://github.com/rack/rack-session

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

RUN_DEPENDS=	rubygem-rack22>=2,3<3,3:www/rubygem-rack22

USES=		gem

NO_ARCH=	yes
PORTSCOUT=	limit:^1\.0\.

.include <bsd.port.mk>
