# This should be sub-packages...

PORTNAME=	base
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	databases
PKGNAMEPREFIX=	qt6-
PKGNAMESUFFIX=	_sqldriver-${FLAVOR}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt base (${FLAVOR} sqldriver)

FLAVORS=	sqlite mysql odbc psql
FLAVOR?=	sqlite

WRKSRC_SUBDIR=	src/plugins/sqldrivers

USES=		cmake compiler:c++17-lang pkgconfig qt-dist:6 \
		${${FLAVOR}_USES}
USE_QT=		base

CMAKE_ARGS=	-DCMAKE_PROJECT_NAME=Qt6${FLAVOR}
CMAKE_ON=	FEATURE_sql_${FLAVOR} ${${FLAVOR}_CMAKE_ON}
CMAKE_OFF=	${FLAVORS:N${FLAVOR}:S/^/FEATURE_sql_/} \
		FEATURE_sql_ibase \
		QT_GENERATE_SBOM

mysql_USES=		mysql
odbc_LIB_DEPENDS=	libodbc.so:databases/unixODBC
psql_USES=		pgsql
sqlite_USES=		sqlite:3
sqlite_CMAKE_ON=	QT_FEATURE_system_sqlite
sqlite_LIB_DEPENDS=	libsqlite3.so.0:databases/sqlite3
${FLAVOR}_PLIST=	${.CURDIR}/pkg-plist.${FLAVOR}

.include <bsd.port.mk>
