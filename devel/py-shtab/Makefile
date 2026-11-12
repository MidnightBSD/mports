PORTNAME=	shtab
PORTVERSION=	1.12.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/tqdm/shtab/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automagic shell tab completion for Python CLI applications
WWW=		https://tqdm.github.io/shtab/ \
		https://github.com/tqdm/shtab

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENCE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
