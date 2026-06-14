PORTNAME=	uuid
PORTVERSION=	2.3.9
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UUID generator library
WWW=		https://github.com/assaf/uuid

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-macaddr>=1.0:net/rubygem-macaddr

NO_ARCH=	yes
USES=		gem

PLIST_FILES=	bin/uuid

.include <bsd.port.mk>
