

PORTNAME=	mysql
PKGNAMESUFFIX=	55-client

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql55-server

PKGMESSAGE=	${.CURDIR}/pkg-message
PATCHDIR=	${.CURDIR}/files
PLIST=		${.CURDIR}/pkg-plist

CONFLICTS_INSTALL=	mysql5[0-46-9]-client-* \
			mariadb*-client-* \
			percona*-client-*

CMAKE_ARGS+=	-DWITHOUT_SERVER=1 -DENABLE_DTRACE:BOOL=OFF

USE_LDCONFIG=	${PREFIX}/lib/mysql

MMAN1=		comp_err.1 msql2mysql.1 mysql.1 mysql_config.1 mysql_find_rows.1 \
		mysql_waitpid.1 mysqlaccess.1 mysqladmin.1 mysqlbinlog.1 \
		mysqlcheck.1 mysqldump.1 mysqlimport.1 mysqlshow.1 mysqlslap.1

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
