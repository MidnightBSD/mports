PORTNAME=	sagemaker-mlflow
DISTVERSION=	0.5.0
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/_}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SageMaker: AWS Plugin for MLflow with SageMaker
WWW=		https://github.com/aws/sagemaker-mlflow

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}boto3>=1.34:www/py-boto3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mlflow-skinny>=2.8:ai/py-mlflow-skinny@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist concurrent

NO_ARCH=	yes

.include <bsd.port.mk>
