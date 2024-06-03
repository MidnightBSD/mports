PORTNAME=	qrcode
PORTVERSION=	7.4
PORTREVISION=	2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QR Code image generator
WWW=		https://github.com/lincolnloop/python-qrcode

LICENSE=	bsd3

RUN_DEPENDS=	${PY_PILLOW} \
		${PYTHON_PKGNAMEPREFIX}png>=0.0.17:graphics/py-png@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.8:devel/py-six@${PY_FLAVOR} \
		${PYTHON_SITELIBDIR}/typing_extensions.py:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
