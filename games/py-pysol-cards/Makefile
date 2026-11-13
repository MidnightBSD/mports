# Created by: Danilo Egea Gondolfo <danilo@FreeBSD.org>

PORTNAME=	pysol-cards
PORTVERSION=	0.24.0
CATEGORIES=	games python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pysol_cards-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Deal PySol FC Cards
WWW=		https://github.com/shlomif/pysol_cards

LICENSE=	bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} PYTHONSAFEPATH=1
TEST_ENV+=	PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	--import-mode=importlib

.include <bsd.port.mk>
