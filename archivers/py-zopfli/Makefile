PORTNAME=	zopfli
PORTVERSION=	0.2.3
CATEGORIES=	archivers python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zopfli module for python
WWW=		https://github.com/fonttools/py-zopfli

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python zip
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
