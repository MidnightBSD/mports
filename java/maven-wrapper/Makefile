PORTNAME=	maven-wrapper
PORTVERSION=	1
PORTREVISION=	1
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
	${MKDIR} "${PREFIX}/etc/maven-wrapper/instances.d"
	${INSTALL_SCRIPT} "${WRKDIR}/mvn.sh" "${PREFIX}/bin/mvn"

.include <bsd.port.mk>
