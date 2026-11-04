PORTNAME=	rack-protection
PORTVERSION=	2.2.4
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	2
PORTREVISION=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Rack middleware to protect against opportunistic attack
WWW=		https://github.com/sinatra/sinatra/tree/master/rack-protection

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License

BUILD_DEPENDS=	rubygem-rack22>=0,3:www/rubygem-rack22
RUN_DEPENDS=	rubygem-rack22>=0,3:www/rubygem-rack22

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^2\.

.include <bsd.port.mk>
