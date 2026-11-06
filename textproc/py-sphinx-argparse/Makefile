PORTNAME=	sphinx-argparse
DISTVERSION=	0.6.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinx_argparse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx extension that automatically documents argparse
WWW=		https://github.com/ashb/sphinx-argparse

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.10<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.19,1:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=5.1.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
