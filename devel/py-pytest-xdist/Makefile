PORTNAME=	pytest-xdist
PORTVERSION=	1.13.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Py.test plugin for distributed testing and loop-on-failing modes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=0:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}execnet>=1.1:sysutils/py-execnet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=2.4.2:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}py>=1.4.22:devel/py-py@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
# magus issues
NO_TEST=	yes

post-extract:
	${RM} -r ${WRKSRC}/testing/__pycache__

.include <bsd.port.mk>
