PORTNAME=	maven3
DISTVERSION=	3.0.5
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	APACHE/maven/binaries
DISTNAME=	apache-maven-${DISTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java project management tool, 3.x branch

LICENSE=	apache2

RUN_DEPENDS=	mvn:java/maven-wrapper

USES=		cpe
CPE_PRODUCT=	maven
CPE_VENDOR=	apache
USE_JAVA=	yes
NO_BUILD=	yes
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
WRKSRC=		${WRKDIR}/apache-maven-${DISTVERSION}
SUB_FILES=	mvn.sh
SUB_LIST=	CLASSWORLDS_JAR=plexus-classworlds-2.4.jar
INSTANCE_FILE=	030005-${PORTNAME}-${PORTVERSION}
INSTANCES_DIR=	etc/maven-wrapper/instances.d/
PLIST_FILES=	${INSTANCES_DIR}/${INSTANCE_FILE}

post-extract:
	${RM} -f ${WRKSRC}/bin/*.bat
	${ECHO_CMD} "${DATADIR}" > ${WRKSRC}/${INSTANCE_FILE}

do-install:
	cd ${WRKSRC} && ${FIND} . -type d -exec ${MKDIR} ${DATADIR}/{} \;
	cd ${WRKSRC} && ${FIND} . -type f -not -path "\./bin/" -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;
	${INSTALL_DATA} ${WRKSRC}/bin/m2.conf ${DATADIR}/bin/
	${INSTALL_SCRIPT} ${WRKDIR}/mvn.sh ${DATADIR}/bin/mvn
	${MKDIR} ${PREFIX}/${INSTANCES_DIR}
	${INSTALL_DATA} ${WRKSRC}/${INSTANCE_FILE} ${PREFIX}/${INSTANCES_DIR}

post-install:
	@${FIND} -s ${WRKSRC} -not -type d 2>/dev/null | \
		${SED} -ne 's,^${WRKSRC},${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${WRKSRC} -type d 2>/dev/null | \
		${SED} -ne 's,^${WRKSRC},@dirrm ${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}

.include <bsd.port.mk>
