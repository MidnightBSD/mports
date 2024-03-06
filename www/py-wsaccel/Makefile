PORTNAME=	wsaccel
PORTVERSION=	0.6.4
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebSocket Accelerator for ws4py and AutobahnPython
WWW=		https://github.com/methane/wsaccel

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/utf8validator*.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/xormask*.so

.include <bsd.port.mk>
