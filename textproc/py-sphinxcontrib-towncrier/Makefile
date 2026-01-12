PORTNAME=	sphinxcontrib-towncrier
PORTVERSION=	0.5.0a0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/sphinx-contrib/sphinxcontrib-towncrier/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinxcontrib_towncrier-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RST directive for injecting a Towncrier-generated changelog draft
WWW=		https://sphinxcontrib-towncrier.readthedocs.io/en/latest/ \
		https://github.com/sphinx-contrib/sphinxcontrib-towncrier

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}towncrier>=23:textproc/py-towncrier@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
