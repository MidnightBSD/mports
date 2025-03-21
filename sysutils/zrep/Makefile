PORTNAME=	zrep
DISTVERSION=	2.0.2
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	neel@neelc.org
COMMENT=	ZFS based replication and failover solution
WWW=		http://www.bolthole.com/solaris/zrep/

LICENSE=	bolthole
LICENSE_NAME=	bolthole
LICENSE_FILE=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell

RUN_DEPENDS=	bash:shells/bash

USE_GITHUB=	yes
GH_ACCOUNT=	bolthole

PLIST_FILES=	bin/zrep

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}/${PREFIX}/bin

.include <bsd.port.mk>
