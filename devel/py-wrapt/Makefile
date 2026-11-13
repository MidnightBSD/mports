PORTNAME=	wrapt
PORTVERSION=	2.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/GrahamDumpleton/wrapt/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Decorators, wrappers and monkey patching
WWW=		https://github.com/GrahamDumpleton/wrapt

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
