PORTNAME=	flufl.i18n
DISTVERSION=	6.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:tl:C|[-_.]+|_|g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level API for Python internationalization
WWW=		https://flufli18n.readthedocs.io

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}atpublic>=0:devel/py-atpublic@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}diff-cover>=0:devel/py-diff-cover@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sybil>=0:devel/py-sybil@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

PEP517_WHEEL_DISTNAME=	${PORTNAME:C|[-_.]+|_|g}

TEST_ARGS=	tests docs

.include <bsd.port.mk>
