# $MidnightBSD$

PORTNAME=	cassandra
PORTVERSION=	1.0.10
CATEGORIES=	databases java
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	cassandra/${PORTVERSION}
DISTNAME=	apache-cassandra-${PORTVERSION}
EXTRACT_SUFX=	-bin.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source distributed database management system
LICENSE=	apache2

NO_BUILD=	yes
JAVA_VERSION=	1.6
JAVA_VENDOR=	openjdk
REINPLACE_ARGS=	-i ''
USE_JAVA=	yes
USE_RC_SUBR=	cassandra

CONFIGS=	cassandra-topology.properties \
		cassandra.yaml \
		log4j-server.properties \
		log4j-tools.properties
SCRIPTS=	cassandra \
		cassandra-cli \
		json2sstable \
		nodetool \
		sstable2json \
		sstablekeys \
		sstableloader

SUB_FILES=	repaircluster

post-extract:
	@${RM} ${WRKSRC}/bin/*.bat ${WRKSRC}/bin/stop-server
.for i in ${CONFIGS}
	@${MV} ${WRKSRC}/conf/${i} ${WRKSRC}/conf/${i}.sample
.endfor
	@${MV} ${WRKSRC}/bin/cqlshrc.sample ${WRKSRC}/conf
.if empty(PORT_OPTIONS:MCQL)
	@${RM} -r ${WRKSRC}/pylib
	@${RM} ${WRKSRC}/bin/cqlsh
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share/cassandra|${DATADIR}/bin|' \
		${WRKSRC}/bin/cassandra-cli \
		${WRKSRC}/bin/nodetool \
		${WRKSRC}/bin/sstableloader \
		${WRKSRC}/bin/sstable2json \
		${WRKSRC}/bin/json2sstable \
		${WRKSRC}/bin/sstablekeys
	@${REINPLACE_CMD} -e 's|\`dirname \$$\0\`/..|${DATADIR}|' \
		${WRKSRC}/bin/cassandra.in.sh
	@${RM} -f ${WRKSRC}/conf/*.orig

do-install:
	@${MKDIR} ${DATADIR}
	@cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${DATADIR}
	@cd ${DATADIR}/bin/ && ${CHMOD} ${BINMODE} ${SCRIPTS}
	@${INSTALL_SCRIPT} ${WRKDIR}/repaircluster ${DATADIR}/bin
	@${LN} -s ${DATADIR}/bin/cassandra-cli ${PREFIX}/bin/cassandra-cli
	@${LN} -s ${DATADIR}/bin/nodetool ${PREFIX}/bin/nodetool
	@${LN} -s ${DATADIR}/bin/sstableloader ${PREFIX}/bin/sstableloader
	@${LN} -s ${DATADIR}/bin/repaircluster ${PREFIX}/bin/repaircluster
	@${LN} -s ${DATADIR}/bin/json2sstable ${PREFIX}/bin/json2sstable
	@${LN} -s ${DATADIR}/bin/sstable2json ${PREFIX}/bin/sstable2json
	@${LN} -s ${DATADIR}/bin/sstablekeys ${PREFIX}/bin/sstablekeys

.include <bsd.port.mk>
