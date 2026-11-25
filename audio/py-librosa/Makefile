PORTNAME=	librosa
DISTVERSION=	1.0.0
CATEGORIES=	audio python
#MASTER_SITES=	PYPI # no tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module for audio and music processing
WWW=		https://librosa.org/ \
		https://github.com/librosa/librosa

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}soundfile>=0.14.0_1:audio/py-SoundFile@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}soxr>=1.0.0:audio/py-soxr@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}msgpack>=1.0.5:devel/py-msgpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}decorator>=5.2.1:devel/py-decorator@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}joblib>=1.2:devel/py-joblib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lazy_loader>=0.3:devel/py-lazy_loader@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numba>=0.61.0:devel/py-numba@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=20.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pooch>=1.7:devel/py-pooch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=2.1.0,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-learn>=1.6.0:science/py-scikit-learn@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scipy>=1.15.0,1:science/py-scipy@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}matplotlib>=3.10.0:math/py-matplotlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=23.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mpl>0:devel/py-pytest-mpl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}resampy>=0.4.3:audio/py-resampy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}samplerate>0:audio/py-samplerate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scipy-stubs>0:science/py-scipy-stubs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-decorator>0:devel/py-types-decorator@${PY_FLAVOR}

USES=		python:3.12+
USE_PYTHON=	pep517 autoplist pytest

USE_GITHUB=	yes
GH_TUPLE=	librosa:librosa-test-data:72bd79e:test_data/tests/data

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		DISPLAY=${DISPLAY} \
		XAUTHORITY=${XAUTHORITY}

NO_ARCH=	yes

# FreeBSD 1.0.0 tests: 10,840 passed, 2 skipped, 17 deselected, 556 xfailed,
# 9 xpassed. Two tests are ignored by the FreeBSD port.

.include <bsd.port.mk>
