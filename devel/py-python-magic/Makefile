PORTNAME=	python-magic
PORTVERSION=	0.4.27
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File type identification using libmagic
WWW=		https://github.com/ahupp/python-magic

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils pytest

NO_ARCH=	yes
TEST_ENV=	LC_ALL=en_US.UTF-8 PYTHONPATH=${STAGEDIR}${PYTHON_SITELIBDIR}

USE_GITHUB=	yes
GH_ACCOUNT=	ahupp

.include <bsd.port.mk>
