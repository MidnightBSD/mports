PORTNAME=	pexpect
PORTVERSION=	4.9.0
CATEGORIES=	misc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module for controlling interactive programs in pseudo-terminal
WWW=		https://pexpect.readthedocs.io/en/stable/ \
		https://github.com/pexpect/pexpect

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ptyprocess>=0.5:sysutils/py-ptyprocess@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils unittest

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
