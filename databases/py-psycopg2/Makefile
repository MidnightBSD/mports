PORTNAME=	psycopg2
PORTVERSION=	2.9.13
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance Python adapter for PostgreSQL

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/doc/COPYING.LESSER

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		pgsql python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psycopg2/_psycopg*.so

.include <bsd.port.mk>
