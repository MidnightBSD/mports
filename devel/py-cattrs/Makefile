PORTNAME=	cattrs
PORTVERSION=	26.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Composable complex class support for attrs and dataclasses
WWW=		https://catt.rs/en/stable/ \
		https://github.com/python-attrs/cattrs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=25.4.0:devel/py-attrs@${PY_FLAVOR} \
		${PY_EXCEPTIONGROUP} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.14.0:devel/py-typing-extensions@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=6.135.26:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}immutables>=0.21:devel/py-immutables@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.4.1,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-benchmark>=5.1.0:devel/py-pytest-benchmark@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	HOME=${WRKDIR}/test-home PYTHONDONTWRITEBYTECODE=1

OPTIONS_DEFINE=	CBOR2 MSGPACK MSGSPEC ORJSON PYYAML TOMLKIT TOMLLIB UJSON
CBOR2_DESC=	CBOR2 serialization support
MSGPACK_DESC=	msgpack serialization support
MSGSPEC_DESC=	msgspec serialization support
ORJSON_DESC=	orjson serialization support
PYYAML_DESC=	PyYAML serialization support
TOMLKIT_DESC=	tomlkit serialization support
TOMLLIB_DESC=	tomli/tomli-w serialization support
UJSON_DESC=	UltraJSON serialization support

CBOR2_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cbor2>=5.4.6:devel/py-cbor2@${PY_FLAVOR}
MSGPACK_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=1.0.5:devel/py-msgpack@${PY_FLAVOR}
MSGSPEC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgspec>=0.21.1:devel/py-msgspec@${PY_FLAVOR}
ORJSON_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}orjson>=3.11.3:devel/py-orjson@${PY_FLAVOR}
PYYAML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0:devel/py-pyyaml@${PY_FLAVOR}
TOMLKIT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tomlkit>=0.11.8:textproc/py-tomlkit@${PY_FLAVOR}
TOMLLIB_RUN_DEPENDS=	${PY_TOMLI} \
			${PYTHON_PKGNAMEPREFIX}tomli-w>=1.1.0:textproc/py-tomli-w@${PY_FLAVOR}
UJSON_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ujson>=5.10.0:devel/py-ujson@${PY_FLAVOR}

do-test:
	@${MKDIR} ${WRKDIR}/test-home
	cd ${TEST_WRKSRC} && ${SETENV} ${PYTHON_TEST_ENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.mk>
