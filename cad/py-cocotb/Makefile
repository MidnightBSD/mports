PORTNAME=	cocotb
DISTVERSIONPREFIX=	v
DISTVERSION=	2.1.0
CATEGORIES=	cad python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Coroutine based cosimulation library for writing VHDL and Verilog
WWW=		https://www.cocotb.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-git-versioning>=3.0<4:devel/py-setuptools-git-versioning@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}find-libpython>0:devel/py-find-libpython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=6:devel/py-pytest@${PY_FLAVOR} \
		gtkwave:cad/gtkwave
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8.4:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}find-libpython>0:devel/py-find-libpython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.10.0:devel/py-pytest-mock@${PY_FLAVOR} \
		iverilog:cad/iverilog \
		bash:shells/bash

USES=		python:3.11+ python-setuptools:83 shebangfix
USE_PYTHON=	pep517 autoplist
USE_GITHUB=	yes

SHEBANG_GLOB=	*.py

BINARY_ALIAS=	python=${PYTHON_CMD}

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${PYTHONPREFIX_SITELIBDIR} \
		PATH=${BINARY_LINKDIR}:${FAKE_DESTDIR}${LOCALBASE}/bin:${LOCALBASE}/bin:${PATH} \
		LD_LIBRARY_PATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/cocotb/libs \
		SIM=icarus

OPTIONS_DEFINE=		IVERILOG VERILATOR # GHDL - TODO
OPTIONS_DEFAULT=	IVERILOG VERILATOR

IVERILOG_DESC=		Iverilog dependency
IVERILOG_RUN_DEPENDS=	iverilog:cad/iverilog

VERILATOR_DESC=		Verilator dependency
VERILATOR_RUN_DEPENDS=	verilator:cad/verilator

post-install:
	@${STRIP_CMD} \
		${STAGEDIR}${PYTHON_SITELIBDIR}/cocotb/simulator${PYTHON_TAG}.so \
		${STAGEDIR}${PYTHON_SITELIBDIR}/cocotb/libs/lib*.so

post-patch:
	@${REINPLACE_CMD} 's,python -m,${PYTHON_CMD} -m,g' ${WRKSRC}/Makefile \
		${WRKSRC}/tests/test_cases/test_fatal/Makefile \
		${WRKSRC}/tests/test_cases/test_failure/Makefile
	@${REINPLACE_CMD} -e 's,python -c,${PYTHON_CMD} -c,g' \
		-e 's,export PYTHONPATH := .,export PYTHONPATH := .:$${PYTHONPATH},g' \
		${WRKSRC}/tests/test_cases/test_custom_entry/Makefile \
		${WRKSRC}/tests/test_cases/test_multi_level_module_path/Makefile

do-test: # some tests fail, see https://github.com/cocotb/cocotb/issues/3236, https://github.com/cocotb/cocotb/issues/3435
	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${GMAKE} test

.include <bsd.port.mk>
