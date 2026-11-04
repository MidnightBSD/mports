PORTNAME=	gibbler
PORTVERSION=	1.0.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git-like hashes for Ruby objects
WWW=		https://github.com/delano/gibbler

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-attic>=1.0<2:devel/rubygem-attic \
		rubygem-rake>=13.0<14:devel/rubygem-rake
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
