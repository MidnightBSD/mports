PORTNAME=	orjson
DISTVERSION=	3.11.9
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://codeload.github.com/ijl/orjson/tar.gz/705515d77b28429d0b7c30c3d781abe52e8a1e5a?filename=/:tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
# Workaround to use both the PyPI tarball and the cargo crates.
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${PORTNAME}-${DISTVERSION}-tests.tar.gz:tests
EXTRACT_ONLY=	${_DISTFILES:N${PORTNAME}-${DISTVERSION}-tests.tar.gz}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, correct JSON library for Python
WWW=		https://pypi.org/project/orjson/ \
		https://github.com/ijl/orjson/

LICENSE=	MPL20 mit
LICENSE_COMB=	multi
LICENSE_FILE_MPL20=	${WRKSRC}/LICENSE-MPL-2.0
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.95:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1<2:devel/py-maturin@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Faker>=17.0:devel/py-Faker@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dateutil>=2<3:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pandas>0,1:math/py-pandas@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pendulum>0:devel/py-pendulum@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>0,1:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xxhash>0:devel/py-xxhash@${PY_FLAVOR}

USES=		cargo cpe python:3.10+
CPE_VENDOR=	ijl
USE_PYTHON=	autoplist concurrent pep517 pytest

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no
CARGO_TARGET_DIR=${WRKSRC}/target

MAKE_ENV=	${CARGO_ENV}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

BINARY_ALIAS=	python3=${PYTHON_CMD}

pre-test:
	${TAR} -xzf ${DISTDIR}/${PORTNAME}-${DISTVERSION}-tests.tar.gz \
		-C ${WRKSRC} --strip-components 1 \
		orjson-705515d77b28429d0b7c30c3d781abe52e8a1e5a/data

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/orjson/orjson*.so

.include <bsd.port.mk>
