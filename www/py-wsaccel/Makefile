PORTNAME=	wsaccel
PORTVERSION=	0.6.6
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebSocket Accelerator for ws4py and AutobahnPython
WWW=		https://github.com/methane/wsaccel

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

DEPRECATED=	Upstream ceased development

USES=		python
USE_PYTHON=	autoplist distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/utf8validator*.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/xormask*.so

.include <bsd.port.mk>
