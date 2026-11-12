PORTNAME=	invoke
PORTVERSION=	3.0.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python task execution tool and library
WWW=		https://www.pyinvoke.org/ \
		https://github.com/pyinvoke/invoke

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	SUDO
SUDO_DESC=	Run shell commands via sudo

SUDO_RUN_DEPENDS=	sudo:security/sudo

.include <bsd.port.mk>
