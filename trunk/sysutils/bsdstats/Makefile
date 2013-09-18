# $MidnightBSD$ 

PORTNAME=	bsdstats
PORTVERSION=	5.5
PORTREVISION=	4
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine

LICENSE=	unknown

USE_RC_SUBR=	bsdstats
SUB_FILES=	300.statistics pkg-message

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${WRKDIR}/300.statistics ${PREFIX}/etc/periodic/monthly

.include <bsd.port.mk>
