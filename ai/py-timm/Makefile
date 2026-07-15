PORTNAME=	timm
DISTVERSION=	1.0.22
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyTorch Image Models
WWW=		https://huggingface.co/docs/timm/index \
		https://github.com/huggingface/pytorch-image-models

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}huggingface-hub>0:ai/py-huggingface-hub@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytorch>0:ai/py-pytorch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}torchvision>0:ai/py-torchvision@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}safetensors>0:ai/py-safetensors@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>0:devel/py-pyyaml@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}expecttest>0:devel/py-expecttest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-forked>0:devel/py-pytest-forked@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>0:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist pytest # some tests fail, tests consume gigabytes of disk space

NO_ARCH=	yes

.include <bsd.port.mk>
