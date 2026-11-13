PORTNAME=	sentencepiece
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.2
CATEGORIES=	textproc # machine-learning
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unsupervised text tokenizer for Neural Network-based text generation
WWW=		https://github.com/google/sentencepiece

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/../LICENSE

BUILD_DEPENDS=	protobuf>0:devel/protobuf \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pybind11>=2.12:devel/py-pybind11@${PY_FLAVOR}

BUILD_RUN_DEPENDS=	sentencepiece>=0.2.2:textproc/sentencepiece
LIB_DEPENDS=	libsentencepiece.so:textproc/sentencepiece
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>0:devel/py-protobuf@${PY_FLAVOR}

USES=		compiler:c++17-lang pkgconfig python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517

USE_GITHUB=	yes
GH_ACCOUNT=	google

WRKSRC_SUBDIR=	python

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' ${WRKSRC}/setup.py

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v test

.include <bsd.port.mk>
