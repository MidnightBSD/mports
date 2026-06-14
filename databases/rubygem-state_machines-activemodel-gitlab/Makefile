PORTNAME=	state_machines-activemodel
PORTVERSION=	0.100.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support for creating state machines for attributes on ActiveModel
WWW=		https://github.com/state-machines/state_machines-activemodel

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel-gitlab>=7.2:databases/rubygem-activemodel-gitlab \
		rubygem-state_machines-gitlab>=0.100.0:devel/rubygem-state_machines-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
