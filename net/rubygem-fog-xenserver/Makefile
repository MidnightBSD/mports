PORTNAME=	fog-xenserver
PORTVERSION=	1.0.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for the 'fog' gem to support XENSERVER
WWW=		https://github.com/fog/fog-xenserver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-fog-core>=0:devel/rubygem-fog-core \
		rubygem-fog-xml>=0:textproc/rubygem-fog-xml \
		rubygem-xmlrpc>=0:net/rubygem-xmlrpc

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
