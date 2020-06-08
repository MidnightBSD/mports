PORTNAME=	GitPython
DISTVERSION=	2.1.11
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Git Library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS+=	git:devel/git
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ddt>=1.1.1:devel/py-ddt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gitdb2>=2.0.0:devel/py-gitdb2@${PY_FLAVOR} \
		git:devel/git
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}nose>=0:devel/py-nose@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

do-test:
	cd ${WRKSRC} && ${PYTHON_CMD} -m nose

.include <bsd.port.mk>
