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
WWW=		https://mato.gamato.org/freebsd/

LICENSE=	unknown

USE_RC_SUBR=	change_splash
NO_BUILD=	yes
SUB_FILES=	pkg-message

do-fetch:
	@${DO_NADA}

do-install:
	${MKDIR} ${DATADIR}

.include <bsd.port.mk>
