PORTNAME=	pygaljs
PORTVERSION=	1.0.2
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package providing pygal JavaScript assets
WWW=		https://github.com/ionelmc/python-pygaljs

LICENSE=	gpl3+ mit
LICENSE_COMB=	multi
LICENSE_FILE_gpl3+ =	${PORTSDIR}/Templates/Licenses/gpl3
LICENSE_FILE_mit=	${FILESDIR}/LICENSE.jquery-sizzle

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ARGS=	-rxEfs --strict --ignore=docs/conf.py --ignore=setup.py --ignore=ci \
		--doctest-modules --doctest-glob='*.rst' --tb=short
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

.include <bsd.port.mk>
