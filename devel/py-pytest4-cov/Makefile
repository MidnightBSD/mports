PORTNAME=	pytest4-cov
PORTVERSION=	2.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C/4//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest plugin for measuring coverage (legacy version for pytest 4)

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}pytest-cov

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=4.4:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest4>=3.6:devel/py-pytest4@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils
PYDISTUTILS_PKGNAME=	${PORTNAME:C/4//}

NO_ARCH=	yes

.include <bsd.port.mk>
