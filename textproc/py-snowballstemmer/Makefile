PORTNAME=	snowballstemmer
PORTVERSION=	3.0.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Snowball stemming library collection for Python
WWW=		https://snowballstem.org/ \
		https://github.com/snowballstem/snowball

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	PYSTEMMER
OPTIONS_DEFAULT=PYSTEMMER
PYSTEMMER_DESC=	Use PyStemmer to accelerate

PYSTEMMER_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pystemmer>=0:textproc/py-pystemmer@${PY_FLAVOR}

.include <bsd.port.mk>
