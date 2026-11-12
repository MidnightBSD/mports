PORTNAME=	legacy-cgi
PORTVERSION=	2.6.4
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	legacy_cgi-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fork of the standard library cgi and cgitb modules
WWW=		https://github.com/jackrosenthal/legacy-cgi

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		python:3.8+ shebangfix
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

NO_ARCH=	yes

SHEBANG_FILES=	cgi.py

.include <bsd.port.mk>
