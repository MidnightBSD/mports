PORTNAME=	fiber-local
PORTVERSION=	1.1.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide a class-level mixin to make fiber local state easy
WWW=		https://socketry.github.io/fiber-local/ \
		https://github.com/socketry/fiber-local

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fiber-storage>=0:devel/rubygem-fiber-storage

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
