PORTNAME=	sagemaker
DISTVERSION=	3.15.0
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SageMaker: Library for training, deploying models on Amazon SageMaker
WWW=		https://sagemaker.readthedocs.io/en/stable/ \
		https://github.com/aws/sagemaker-python-sdk

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sagemaker-core>=2.14.0:ai/py-sagemaker-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sagemaker-mlops>=1.14.0:ai/py-sagemaker-mlops@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sagemaker-serve>=1.14.0:ai/py-sagemaker-serve@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sagemaker-train>=1.14.0:ai/py-sagemaker-train@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
