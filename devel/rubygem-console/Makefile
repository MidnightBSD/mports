PORTNAME=	console
PORTVERSION=	1.34.3
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beautiful logging for Ruby
WWW=		https://socketry.github.io/console/ \
		https://github.com/socketry/console

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fiber-annotation>=0:devel/rubygem-fiber-annotation \
		rubygem-fiber-local>=1.1<2:devel/rubygem-fiber-local \
		rubygem-json>=0:devel/rubygem-json

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
