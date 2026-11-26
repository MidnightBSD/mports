PORTNAME=	torchcodec
DISTVERSIONPREFIX=	v
DISTVERSION=	0.17.0
CATEGORIES=	multimedia python
#MASTER_SITES=	PYPI # no tarball
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyTorch media decoding and encoding
WWW=		https://github.com/pytorch/torchcodec

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pybind11>0:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytorch>=2.15.0:ai/py-pytorch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-build-core>0:devel/py-scikit-build-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libavformat.so:multimedia/ffmpeg \
		libavif.so:graphics/libavif \
		libheif.so:graphics/libheif \
		libpng16.so:graphics/png \
		libprotobuf.so:devel/protobuf \
		libwebp.so:graphics/webp
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytorch>=2.15.0:ai/py-pytorch@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.16:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR}

USES=		cmake:indirect compiler:c++17-lang jpeg localbase pkgconfig python:3.11+
USE_PYTHON=	pep517 autoplist pytest

USE_GITHUB=	yes
GH_ACCOUNT=	meta-pytorch

#MAKE_ENV=	BUILD_AGAINST_ALL_FFMPEG_FROM_S3=1 # downloads binaries with this choice, see https://github.com/meta-pytorch/torchcodec/issues/1194
MAKE_ENV=	I_CONFIRM_THIS_IS_NOT_A_LICENSE_VIOLATION=1
MAKE_ENV+=	TORCHCODEC_BUILD_WEBP=0 TORCHCODEC_BUILD_AVIF=0
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

.include <bsd.port.mk>
