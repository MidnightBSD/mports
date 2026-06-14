PORTNAME=	state_machines-activerecord
PORTVERSION=	0.9.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support for creating state machines for attributes on ActiveRecord
WWW=		https://github.com/state-machines/state_machines-activerecord

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord60>=6.0:databases/rubygem-activerecord60 \
		rubygem-state_machines-activemodel>=0.9.0:databases/rubygem-state_machines-activemodel

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
