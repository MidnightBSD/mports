# New ports collection makefile for: windowmaker-desktop
# Date created:	8 March 2007
# Whom:			Lucas Holt
#
# $MidnightBSD$
#

PORTNAME=	windowmaker-desktop
PORTVERSION=	1.0
CATEGORIES=	x11 windowmaker
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        WindowMaker based desktop environment

RUN_DEPENDS=	windowmaker:${PORTSDIR}/x11-wm/windowmaker \
		wdm:${PORTSDIR}/x11/wdm \
		wmlpq:${PORTSDIR}/print/wmlpq \
		wmbinclock:${PORTSDIR}/x11-clocks/wmbinclock \
		wmcalclock:${PORTSDIR}/x11-clocks/wmcalclock \
		wterm:${PORTSDIR}/x11/wterm \
		wmmp3:${PORTSDIR}/audio/wmmp3 \
		wmsmixer:${PORTSDIR}/audio/wmsmixer \
		wmicons:${PORTSDIR}/graphics/wmicons \
		wmweather+:${PORTSDIR}/misc/wmweather+ \
		xscreensaver.app:${PORTSDIR}/x11/xscreensaver.app

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
