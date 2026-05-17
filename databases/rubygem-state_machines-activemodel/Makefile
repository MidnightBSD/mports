PORTNAME=	state_machines-activemodel
PORTVERSION=	0.9.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support for creating state machines for attributes on ActiveModel
WWW=		https://github.com/state-machines/state_machines-activemodel

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel60>=6.0:databases/rubygem-activemodel60 \
		rubygem-state_machines>=0.6.0:devel/rubygem-state_machines

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
