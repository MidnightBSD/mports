PORTNAME=	psycopg
PORTVERSION=	3.2.4
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostgreSQL database adapter for Python
WWW=		https://www.psycopg.org/psycopg3/ \
		https://github.com/psycopg/psycopg

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=49.2.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.37:devel/py-wheel@${PY_FLAVOR}

USES=		pgsql python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	C POOL
OPTIONS_DEFAULT=C POOL
C_DESC=		C extension support
POOL_DESC=	Connection pool support

C_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}psycopg-c>=${PORTVERSION}:databases/py-psycopg-c@${PY_FLAVOR}
POOL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psycopg-pool>=0:databases/py-psycopg-pool@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30900
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}backports.zoneinfo>=0.2.0:devel/py-backports.zoneinfo@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} < 31300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.6:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
