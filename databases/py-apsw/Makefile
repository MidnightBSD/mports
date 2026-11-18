PORTNAME=	apsw
PORTVERSION=	3.54.1.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another Python SQLite Wrapper
WWW=		https://rogerbinns.github.io/apsw/ \
		https://github.com/rogerbinns/apsw

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

BUILD_RUN_DEPENDS=	sqlite3>=${PORTVERSION:R:R},1:databases/sqlite3

USES=		localbase python sqlite:port
USE_PYTHON=	autoplist concurrent pep517
# unittest

# TEST OFF
NO_TEST=	yes
#TEST_ARGS=	discover -s ${WRKSRC}/apsw
#TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

post-patch:
	@${PRINTF} '[build_ext]\nuse_system_sqlite_config = True\n' > ${WRKSRC}/setup.apsw

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
