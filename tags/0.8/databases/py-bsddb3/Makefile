# $MidnightBSD$

PORTNAME=	bsddb3
PORTVERSION=	6.1.1
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python extension module for BerkeleyDB 3 and 4

LICENSE=	bsd3

USE_BDB=	yes
USES=		python
USE_PYTHON=	distutils autoplist

PYDISTUTILS_CONFIGUREARGS=--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_BUILDARGS=	--libs="-l${BDB_LIB_NAME}" --berkeley-db=${LOCALBASE}
PYDISTUTILS_INSTALLARGS=-c -O1 --prefix=${TRUE_PREFIX} --berkeley-db=${LOCALBASE}

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}

post-patch:
	${REINPLACE_CMD} 's,%%DBVERSION%%,${BDB_LIB_NAME},g' ${WRKSRC}/setup2.py ${WRKSRC}/setup3.py
	${REINPLACE_CMD} 's,<db\.h>,<${BDB_INCLUDE_DIR}/db.h>,' ${WRKSRC}/Modules/bsddb.h
	${REINPLACE_CMD} 's,%%BDB_INCLUDE_DIR%%,${BDB_INCLUDE_DIR},' ${WRKSRC}/setup2.py ${WRKSRC}/setup3.py
	${REINPLACE_CMD} 's,%%BDB_LIB_NAME%%,${BDB_LIB_NAME},' ${WRKSRC}/setup3.py

post-install:
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${DOCSDIR})

.include <bsd.port.mk>
