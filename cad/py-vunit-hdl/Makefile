PORTNAME=	vunit-hdl
DISTVERSIONPREFIX=	v
DISTVERSION=	4.7.1
CATEGORIES=	cad python
#MASTER_SITES=	PYPI # some files are missing during tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source unit testing framework for VHDL/SystemVerilog
WWW=		https://vunit.github.io/

LICENSE=	Apache-2.0 mit MPL20
LICENSE_COMB=	multi
LICENSE_FILE_MPL20=	${WRKSRC}/LICENSE.rst
LICENSE_FILE_Apache-2.0=	${WRKSRC}/vunit/vhdl/osvvm/LICENSE.md
LICENSE_FILE_mit=	${WRKSRC}/vunit/vhdl/JSON-for-VHDL/tests/JSONTestSuite/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=35.0.2<82.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colorama>=0:devel/py-colorama@${PY_FLAVOR} \
		ghdl:cad/ghdl
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mypy>0:devel/py-mypy@${PY_FLAVOR} \
		pylint:devel/pylint@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517 pytest # Upstream pins Pylint 2.17.2; current provider is 4.0.10
PYTEST_IGNORED_TESTS=	test_pylint

USE_GITHUB=	yes
GH_ACCOUNT=	VUnit
GH_PROJECT=	vunit
GH_TUPLE=	Paebbels:JSON-for-VHDL:95e848b:j4v/vunit/vhdl/JSON-for-VHDL \
		OSVVM:OSVVM:871f509:osvvm/vunit/vhdl/osvvm

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

pre-test:
	@if [ -d "${WRKSRC}/build" ]; then \
		preserve_dir=$$(${MKTEMP} -d "${WRKDIR}/vunit-generated-build.XXXXXXXX") && \
		${MV} "${WRKSRC}/build" "$$preserve_dir/build"; \
	fi

.include <bsd.port.mk>
