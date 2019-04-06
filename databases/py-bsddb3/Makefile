# $MidnightBSD$

PORTNAME=	bsddb3
PORTVERSION=	6.2.6
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python extension module for BerkeleyDB 4+

LICENSE=	bsd3

USES=		bdb python
USE_PYTHON=	distutils autoplist
USE_GCC=	yes

PYDISTUTILS_CONFIGUREARGS=--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_BUILDARGS=	--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_INSTALLARGS=-c -O1 --prefix=${TRUE_PREFIX} --berkeley-db=${LOCALBASE}

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} 's,%%DBVERSION%%,${BDB_LIB_NAME},g' ${WRKSRC}/setup2.py ${WRKSRC}/setup3.py
	@${REINPLACE_CMD} 's,<db\.h>,<${BDB_INCLUDE_DIR}/db.h>,' ${WRKSRC}/Modules/bsddb.h
	@${REINPLACE_CMD} 's,%%BDB_INCLUDE_DIR%%,${BDB_INCLUDE_DIR},' ${WRKSRC}/setup2.py ${WRKSRC}/setup3.py
	@${REINPLACE_CMD} 's,%%BDB_LIB_NAME%%,${BDB_LIB_NAME},' ${WRKSRC}/setup3.py

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${STAGEDIR}${DOCSDIR})
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/bsddb3/_pybsddb.so

.include <bsd.port.mk>
