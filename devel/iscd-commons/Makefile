PORTNAME=	Commons
PORTVERSION=	1.0.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel science
PKGNAMEPREFIX=	ISCD-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common code shared by many ISCD softwares
WWW=		https://github.com/ISCDtoolbox/Commons

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake

USE_GITHUB=	yes
GH_ACCOUNT=	ISCDtoolbox

CFLAGS+=	-funroll-loops
USE_LDCONFIG=	yes

.include <bsd.port.mk>
