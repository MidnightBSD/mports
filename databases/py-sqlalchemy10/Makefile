PORTNAME=	sqlalchemy
PORTVERSION=	1.0.14
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	10
DISTNAME=	SQLAlchemy-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python SQL toolkit and Object Relational Mapper 1.0.x

LICENSE=	mit

USES=		python:3.6+
USE_PYTHON=	distutils autoplist

PY2TO3_CMD=	${LOCALBASE}/bin/2to3-${PYTHON_VER}
PY2TO3_ARGS=	--no-diffs --nobackups --verbose --write
NO_TEST=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}sqlalchemy0[6789]* ${PYTHON_PKGNAMEPREFIX}sqlalchemy1[12]

OPTIONS_DEFINE=		DOCS EXAMPLES
OPTIONS_MULTI=		BACKEND
OPTIONS_MULTI_BACKEND=	MSSQL PGSQL SQLITE
OPTIONS_DEFAULT=	SQLITE

MSSQL_DESC=	MS SQL Server backend

MSSQL_RUN_DEPENDS=	${PYTHON_SITELIBDIR}/pymssql.py:databases/py-pymssql@${PY_FLAVOR}
PGSQL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psycopg2>=2.0.8:databases/py-psycopg2@${PY_FLAVOR}
SQLITE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR}

PORTDOCS=		*
PORTEXAMPLES=		*

pre-build:
	@${PY2TO3_CMD} ${PY2TO3_ARGS} ${WRKSRC}/lib
	@${PY2TO3_CMD} ${PY2TO3_ARGS} ${WRKSRC}/doc
	@${PY2TO3_CMD} ${PY2TO3_ARGS} ${WRKSRC}/examples

# C extensions are not supported with all versions of Python, so ignore
# errors here if there are no .so files to strip.
post-install:
	-@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sqlalchemy/*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
