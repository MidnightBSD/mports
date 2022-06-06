PORTNAME=	ansible-compat
PORTVERSION=	2.0.4
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ansible compatibility goodies

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm>=6.3.1:devel/py-setuptools_scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm_git_archive>=1.0:devel/py-setuptools_scm_git_archive@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}subprocess-tee>=0.3.5:devel/py-subprocess-tee@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
