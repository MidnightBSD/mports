PORTNAME=	pyperclip
PORTVERSION=	1.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	shaun@FreeBSD.org
COMMENT=	Cross-platform clipboard module for Python
WWW=		https://github.com/asweigart/pyperclip

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		dos2unix python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
