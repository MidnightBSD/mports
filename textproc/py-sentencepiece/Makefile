PORTNAME=	sentencepiece
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.3
CATEGORIES=	textproc # machine-learning
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unsupervised text tokenizer for Neural Network-based text generation
WWW=		https://github.com/google/sentencepiece

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/../LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pybind11>=2.13:devel/py-pybind11@${PY_FLAVOR} \
		flatbuffers>=25.12.19:devel/flatbuffers \
		flatc:devel/flatbuffers \
		protoc:devel/protobuf \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

BUILD_RUN_DEPENDS=	sentencepiece>=0.2.3:textproc/sentencepiece
LIB_DEPENDS=	libsentencepiece.so:textproc/sentencepiece
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>0:devel/py-protobuf@${PY_FLAVOR}

USES=		compiler:c++20-lang pkgconfig python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517

USE_GITHUB=	yes
GH_ACCOUNT=	google

WRKSRC_SUBDIR=	python

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' ${WRKSRC}/setup.py
	@${REINPLACE_CMD} -e 's|absl::byteswap(|__builtin_bswap32(|' ${WRKSRC}/../lite/sentencepiece_model_converters.h
	@${REINPLACE_CMD} -E -e 's|absl::MutexLock ([a-z_]+)\(([a-z_]+)\)|absl::MutexLock \1(\&\2)|' ${WRKSRC}/src/sentencepiece/sentencepiece_pybind.cc

pre-build:
	@${MKDIR} ${WRKSRC}/gen
	${LOCALBASE}/bin/protoc --cpp_out=${WRKSRC}/gen -I${WRKSRC}/../src ${WRKSRC}/../src/sentencepiece_model.proto
	${LOCALBASE}/bin/flatc -c --gen-object-api -o ${WRKSRC}/gen ${WRKSRC}/../lite/sentencepiece_lite.fbs

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v test

.include <bsd.port.mk>
