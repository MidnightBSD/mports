PORTNAME=	rackup
PORTVERSION=	2.3.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General server command for Rack applications
WWW=		https://github.com/rack/rackup

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.md

BUILD_DEPENDS=	rubygem-rack>=3:www/rubygem-rack
RUN_DEPENDS=	rubygem-rack>=3:www/rubygem-rack

USES=		gem

CONFLICTS_INSTALL=	rubygem-rackup21 # bin/rackup

NO_ARCH=	yes

PLIST_FILES=	bin/rackup

.include <bsd.port.mk>
