PORTNAME=	ufolib2
PORTVERSION=	0.18.1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UFO font processing library
WWW=		https://github.com/fonttools/ufoLib2

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.2:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61.2:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=22.1.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.58.0:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fs2>=2.2.0<3:filesystems/py-fs2@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cattrs>=25.1.1:devel/py-cattrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}msgpack>=0:devel/py-msgpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}orjson>=0:devel/py-orjson@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517 pytest
PEP517_WHEEL_DISTNAME=	ufoLib2

NO_ARCH=	yes

OPTIONS_DEFINE=		CONVERTERS JSON LXML MSGPACK
CONVERTERS_DESC=	Converters support
LXML_DESC=		XML support
MSGPACK_DESC=		MessagePack support

CONVERTERS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cattrs>=25.1.1:devel/py-cattrs@${PY_FLAVOR}
JSON_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cattrs>=25.1.1:devel/py-cattrs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}orjson>=0:devel/py-orjson@${PY_FLAVOR}
LXML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR}
MSGPACK_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cattrs>=25.1.1:devel/py-cattrs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}msgpack>=0:devel/py-msgpack@${PY_FLAVOR}

do-test:
	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} PYTHONDONTWRITEBYTECODE=1 ${PYTHON_CMD} -m pytest ./tests ufoLib2

.include <bsd.port.mk>
