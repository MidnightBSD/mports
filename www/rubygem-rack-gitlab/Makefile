PORTNAME=	rack
PORTVERSION=	2.2.23
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rack, a modular Ruby web server interface
WWW=		https://github.com/rack/rack

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

USES=		cpe gem

CPE_VENDOR=	rack_project

NO_ARCH=	yes

post-install:
# Avoid CONFLICTS_INSTALL with www/rubygem-rackup
	${RM} ${STAGEDIR}${PREFIX}/bin/rackup

.include <bsd.port.mk>
