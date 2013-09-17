# $MidnightBSD$
# $FreeBSD: ports/sysutils/bsd-splash-changer/Makefile,v 1.1 2006/06/17 23:53:15 alepulver Exp $
#
# This port is self contained.
#

PORTNAME=	bsd-splash-changer
PORTVERSION=	060211
CATEGORIES=	sysutils
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Boot Splash Image Changer
LICENSE=	unknown

USE_RC_SUBR=	change_splash.sh
NO_BUILD=	yes
SUB_FILES=	pkg-message

do-fetch:
	@${DO_NADA}

do-install:
	${MKDIR} ${DATADIR}

.include <bsd.port.mk>
