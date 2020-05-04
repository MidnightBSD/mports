# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	tox
PORTVERSION=	3.12.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Virtualenv-based automation of test activities

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>0:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}py>=1.4.17,<2:devel/py-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=0.3.0,<1:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.0.0,<2:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock>=3.0.0,<4:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}virtualenv>=1.11.2:devel/py-virtualenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}toml>=0.9.4:textproc/py-toml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

# tox.ini clobbers our pytest arguments
post-extract:
	${RM} ${WRKSRC}/tox.ini

.include <bsd.port.mk>
