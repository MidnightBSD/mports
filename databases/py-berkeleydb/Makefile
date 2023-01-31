PORTNAME=	berkeleydb
PORTVERSION=	18.1.5
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Oracle Berkeley DB
WWW=		https://www.jcea.es/programacion/pybsddb.htm

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		bdb python:3.7+
USE_PYTHON=	distutils autoplist

PYDISTUTILS_CONFIGUREARGS=--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_BUILDARGS=	--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_INSTALLARGS=-c -O1 --prefix=${TRUE_PREFIX} --berkeley-db=${LOCALBASE}

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}

NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${BDB_VER} > 5
MAKE_ENV=	YES_I_HAVE_THE_RIGHT_TO_USE_THIS_BERKELEY_DB_VERSION=yes
.endif

post-patch:
	@${REINPLACE_CMD} 's|%%DBVERSION%%|${BDB_LIB_NAME}| ; \
		s|%%BDB_INCLUDE_DIR%%|${BDB_INCLUDE_DIR}| ; \
		s|%%BDB_LIB_NAME%%|${BDB_LIB_NAME}|' \
		${WRKSRC}/setup3.py
	@${REINPLACE_CMD} 's|<db\.h>|<${BDB_INCLUDE_DIR}/db.h>|' ${WRKSRC}/src/Module/berkeleydb.h

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/_${PORTNAME}.cpython-*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${DOCSDIR})


.include <bsd.port.post.mk>
