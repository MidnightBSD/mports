PORTNAME=	emoji
DISTVERSION=	2.15.0
CATEGORIES=	misc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emoji support for Python
WWW=		https://github.com/carpedm20/emoji

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>0:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7.4.4,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.8+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest
NO_ARCH=	yes

.include <bsd.port.mk>
