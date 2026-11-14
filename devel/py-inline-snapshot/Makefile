PORTNAME=	inline-snapshot
DISTVERSION=	0.36.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	inline_snapshot-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create and update inline snapshots in your Python code
WWW=		https://github.com/15r10nk/inline-snapshot

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asttokens>=2.0.5:devel/py-asttokens@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}executing>=2.2.0:devel/py-executing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.3.4,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=13.7.1:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PY_TOMLI}
TEST_DEPENDS=	node:www/node${NODEJS_VERSION} \
		${PYTHON_PKGNAMEPREFIX}black25>=25.1.0<25.1.1:devel/py-black25@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=24.3.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=6.75.5:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}isort>0:devel/py-isort@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mypy>=1.2.0:devel/py-mypy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=1:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyright>=1.1.359:devel/py-pyright@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-freezer>=0.4.9:devel/py-pytest-freezer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.14.0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.6.1,1:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		nodejs:env python:3.10+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

OPTIONS_DEFINE=		BLACK DIRTY-EQUALS
OPTIONS_DEFAULT=	BLACK DIRTY-EQUALS

BLACK_DESC=		Format generated code with Black
DIRTY-EQUALS_DESC=	Support for normalization of data that changes frequently

BLACK_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}black>=23.3.0:devel/py-black@${PY_FLAVOR}
DIRTY-EQUALS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dirty-equals>=0.9.0:devel/py-dirty-equals@${PY_FLAVOR}

# Match upstream's pinned formatter and isolate the declared pytest plugins.
_BLACK_TEST_DIR?=	${PYTHONPREFIX_LIBDIR}/mports-black/25
_INLINE_TEST_PYTHONPATH?=	${_BLACK_TEST_DIR}:${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${TEST_WRKSRC}
_INLINE_TEST_PLUGINS=	inline_snapshot.pytest_plugin _hypothesis_pytestplugin \
			pytest_mock pytest_freezer xdist.plugin xdist.looponfail
TEST_ENV+=	PATH=${_BLACK_TEST_DIR}/bin:${PATH} \
		PYTHONPATH=${_INLINE_TEST_PYTHONPATH} \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		PYTEST_PLUGINS=${_INLINE_TEST_PLUGINS:ts,}

.include <bsd.port.mk>
