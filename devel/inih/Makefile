PORTNAME=	inih
DISTVERSIONPREFIX=	r
DISTVERSION=	58
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple .INI file parser written in C
WWW=		https://github.com/benhoyt/inih

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

TEST_DEPENDS=	bash:shells/bash

USES=		meson
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	benhoyt

do-test:
	@cd ${WRKSRC}/tests && \
		${REINPLACE_CMD} -e 's|gcc|${CC}|' unittest.sh && \
		./unittest.sh && \
		${ECHO} "Tests succeeded"

.include <bsd.port.mk>
