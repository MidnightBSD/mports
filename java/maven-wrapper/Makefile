PORTNAME=	maven-wrapper
PORTVERSION=	2
CATEGORIES=	java devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper script for the various installations of Maven

LICENSE=	bsd2

NO_BUILD=	yes
SUB_FILES=	mvn.sh
SUB_LIST=	CAT=${CAT} FIND=${FIND} TAIL=${TAIL}

do-fecth:
	@${DO_NADA}

do-install:
	${MKDIR} "${STAGEDIR}${ETCDIR}/instances.d"
	${INSTALL_SCRIPT} "${WRKDIR}/mvn.sh" "${STAGEDIR}${PREFIX}/bin/mvn"
	${INSTALL_SCRIPT} "${WRKDIR}/mvn.sh" "${STAGEDIR}${PREFIX}/bin/mvnDebug"

.include <bsd.port.mk>
