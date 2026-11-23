PORTNAME=	cfn-lint
DISTVERSION=	1.56.0
CATEGORIES=	devel python textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AWS CloudFormation Linter
WWW=		https://pypi.org/project/cfn-lint/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}jschema-to-python>=1.2.3:devel/py-jschema-to-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonpatch>0:devel/py-jsonpatch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=3.0<5:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}junit-xml>=1.9:textproc/py-junit-xml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}networkx>=2.4,2<4,2:math/py-networkx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0.3:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}regex>0:textproc/py-regex@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sarif-om>=1.0.4:devel/py-sarif-om@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sympy>=1.14.0:math/py-sympy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>0:devel/py-typing-extensions@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}defusedxml>0:devel/py-defusedxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydot>0:graphics/py-pydot@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 pytest unittest
# The PyPI source archive omits the script exercised by this test.
TEST_ARGS=	--ignore=test/unit/module/maintenance/test_update_specs_from_pricing.py
TEST_ENV=	${MAKE_ENV} \
		PATH=${FAKE_DESTDIR}${PREFIX}/bin:${PATH} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

NO_ARCH=	yes

.include <bsd.port.mk>
