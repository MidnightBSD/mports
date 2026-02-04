PORTNAME=	childprocess
PORTVERSION=	5.1.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	External background process controller
WWW=		https://github.com/enkessler/childprocess

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	rubygem-logger>=1.5:devel/rubygem-logger
RUN_DEPENDS=	rubygem-logger>=1.5<2:devel/rubygem-logger

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
