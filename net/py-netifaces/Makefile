# Created by: Muhammad Moinur Rahman <bofh@FreeBSD.org>

PORTNAME=	netifaces
PORTVERSION=	0.11.0
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Getting network addresses from Python 3

LICENSE=	mit

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/netifaces*.so

.include <bsd.port.mk>
