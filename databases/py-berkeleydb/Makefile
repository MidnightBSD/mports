PORTNAME=	berkeleydb
PORTVERSION=	18.1.17
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Oracle Berkeley DB
WWW=		https://www.jcea.es/programacion/pybsddb.htm

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		bdb python:3.11+ python-setuptools:83
USE_PYTHON=	autoplist pep517

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}

NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

MAKE_ENV+=	BERKELEYDB_INCDIR=${BDB_INCLUDE_DIR} \
		BERKELEYDB_LIBDIR=${BDB_LIB_DIR}

.include <bsd.port.pre.mk>

.if ${BDB_VER} > 5
MAKE_ENV+=	YES_I_HAVE_THE_RIGHT_TO_USE_THIS_BERKELEY_DB_VERSION=yes
.endif

post-patch:
	@${REINPLACE_CMD} 's|%%BDB_LIB_NAME%%|${BDB_LIB_NAME}|' \
		${WRKSRC}/setup3.py
	@${REINPLACE_CMD} 's|<db\.h>|<${BDB_INCLUDE_DIR}/db.h>|' \
		${WRKSRC}/src/Module/berkeleydb.h

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/_${PORTNAME}*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.post.mk>
