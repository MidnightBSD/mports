PORTNAME=	mustermann-grape
PORTVERSION=	1.0.2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adds Grape style patterns to Mustermman
WWW=		https://github.com/ruby-grape/mustermann-grape

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-mustermann>=1.0:devel/rubygem-mustermann

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^1\.0\.

.include <bsd.port.mk>
