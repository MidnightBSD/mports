PORTNAME=	bats-core
DISTVERSIONPREFIX=	v
DISTVERSION=	1.13.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bash automated testing system
WWW=		https://github.com/bats-core/bats-core

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	bash:shells/bash
RUN_DEPENDS=	bash:shells/bash \
		flock:sysutils/flock

USE_GITHUB=	yes

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	cd ${WRKSRC} && ./install.sh ${PREFIX}

.include <bsd.port.mk>
