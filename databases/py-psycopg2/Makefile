PORTNAME=	psycopg2
PORTVERSION=	2.8.6
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance Python adapter for PostgreSQL

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/doc/COPYING.LESSER

USES=		pgsql python
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psycopg2/_psycopg*.so

.include <bsd.port.mk>
