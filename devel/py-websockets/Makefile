# Created by: Emanuel Haupt <ehaupt@FreeBSD.org>

PORTNAME=	websockets
PORTVERSION=	8.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the WebSocket Protocol (RFC 6455 and 7692)

LICENSE=	bsd3

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/websockets/speedups*.so

.include <bsd.port.mk>
