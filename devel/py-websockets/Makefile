PORTNAME=	websockets
PORTVERSION=	12.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the WebSocket Protocol (RFC 6455 and 7692)
WWW=		https://pypi.org/project/websockets/

LICENSE=	bsd3

USES=		cpe python
CPE_VENDOR=	${PORTNAME}_project
USE_PYTHON=	autoplist distutils

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/websockets/speedups*.so

.include <bsd.port.mk>
