PORTNAME=	coap
DISTVERSIONPREFIX=	v
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	net
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt6 CoAP client module

USES=		cmake compiler:c++17-lang qt-dist:6
USE_GITHUB=	yes
GH_TUPLE=	qt:qtcoap:${DISTVERSIONFULL}
USE_QT=		base
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
