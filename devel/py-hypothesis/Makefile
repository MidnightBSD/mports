PORTNAME=	hypothesis
PORTVERSION=	6.168.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	hypothesis-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Property-based testing library for Python
WWW=		https://hypothesis.works/ \
		https://hypothesis.readthedocs.io/en/latest/ \
		https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.91:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.9.4<2.0:devel/py-maturin@${PY_FLAVOR}
RUN_DEPENDS=	${PY_EXCEPTIONGROUP} \
		${PYTHON_PKGNAMEPREFIX}sortedcontainers>=2.1.0<3.0.0:devel/py-sortedcontainers@${PY_FLAVOR}

TEST_DEPENDS=	${PY_EXCEPTIONGROUP} \
		${PYTHON_PKGNAMEPREFIX}sortedcontainers>=2.1.0<3.0.0:devel/py-sortedcontainers@${PY_FLAVOR}

USES=		cargo python:3.10+
USE_PYTHON=	autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_CARGOTOML=${WRKSRC}/rust/Cargo.toml
CARGO_CARGOLOCK=${WRKSRC}/rust/Cargo.lock
CARGO_INSTALL=	no

OPTIONS_DEFINE=	CLI CODEMODS DATEUTIL DJANGO DPCONTRACTS GHOSTWRITER LARK NUMPY PANDAS PYTEST PYTZ REDIS WATCHDOG ZONEINFO
OPTIONS_DEFAULT=CLI DATEUTIL DJANGO DPCONTRACTS GHOSTWRITER LARK NUMPY PANDAS PYTEST PYTZ REDIS ZONEINFO
CLI_DESC=		Command-line interface support
CODEMODS_DESC=		Refactor deprecated or inefficient code
DATEUTIL_DESC=		Provide dateutil timezones
DJANGO_DESC=		Django support
DPCONTRACTS_DESC=	Contracts support
GHOSTWRITER_DESC=	Ghostwriter support
LARK_DESC=		Lark parser support
NUMPY_DESC=		NumPy support
PANDAS_DESC=		Pandas support
PYTEST_DESC=		pytest support
PYTZ_DESC=		Timezone support
REDIS_DESC=		Redis support
WATCHDOG_DESC=		Watchdog support
ZONEINFO_DESC=		Zoneinfo support

CLI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}black>=20.8b0:devel/py-black@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}click>=7.0:devel/py-click@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}rich>=9.0.0:textproc/py-rich@${PY_FLAVOR}
CODEMODS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}libcst>=0.3.16:devel/py-libcst@${PY_FLAVOR}
DATEUTIL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=1.4:devel/py-python-dateutil@${PY_FLAVOR}
DJANGO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django52>=5.2:www/py-django52@${PY_FLAVOR}
DPCONTRACTS_RUN_DEPENDS=${PYTHON_PKGNAMEPREFIX}dpcontracts>=0.4:devel/py-dpcontracts@${PY_FLAVOR}
GHOSTWRITER_RUN_DEPENDS=${PYTHON_PKGNAMEPREFIX}black>=20.8b0:devel/py-black@${PY_FLAVOR}
LARK_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lark>=0.10.1:devel/py-lark@${PY_FLAVOR}
NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.21.6,1:math/py-numpy@${PY_FLAVOR}
PANDAS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pandas>=1.1,1:math/py-pandas@${PY_FLAVOR}
PYTEST_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=4.6,1:devel/py-pytest@${PY_FLAVOR}
PYTZ_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytz>=2014.1,1:devel/py-pytz@${PY_FLAVOR}
REDIS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}redis>=3.0.0:databases/py-redis@${PY_FLAVOR}
WATCHDOG_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}watchdog>=4.0.0:devel/py-watchdog@${PY_FLAVOR}

post-test:
	@d=$$(${MKTEMP} -d ${WRKDIR}/zoneinfo-test.XXXXXXXX) && \
		${PYTHON_CMD} -m installer --destdir "$$d" ${WRKSRC}/dist/*.whl && \
		${SETENV} TMPDIR=${WRKDIR} PYTHONPATH="$$d${PYTHON_SITELIBDIR}:$$PYTHONPATH" \
		${PYTHON_CMD} ${FILESDIR}/test-zoneinfo.py

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
