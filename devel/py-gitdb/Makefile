PORTNAME=	gitdb
PORTVERSION=	4.0.11
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git Object Database
WWW=		https://gitdb.readthedocs.io/en/latest/ \
		https://github.com/gitpython-developers/gitdb

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}smmap>=3.0.1<6:devel/py-smmap@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}gitdb2

.include <bsd.port.mk>
