# New ports collection makefile for: windowmaker-desktop
# Date created:	8 March 2007
# Whom:			Lucas Holt
#
# $MidnightBSD: mports/x11/windowmaker-desktop/Makefile,v 1.5 2007/11/08 23:34:06 laffer1 Exp $
#

PORTNAME=	windowmaker-desktop
PORTVERSION=	1.4
CATEGORIES=	x11 windowmaker
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        WindowMaker based desktop environment
LICENSE=	agg

RUN_DEPENDS=	wmaker:${PORTSDIR}/x11-wm/windowmaker \
		wdm:${PORTSDIR}/x11/wdm \
		wmlpq:${PORTSDIR}/print/wmlpq \
		wmBinClock:${PORTSDIR}/x11-clocks/wmbinclock \
		wmCalClock:${PORTSDIR}/x11-clocks/wmcalclock \
		wmmp3:${PORTSDIR}/audio/wmmp3 \
		wmsmixer:${PORTSDIR}/audio/wmsmixer \
		${LOCALBASE}/share/WindowMaker/Themes/LeetWM.themed/style:${PORTSDIR}/graphics/wmicons \
		wmweather+:${PORTSDIR}/misc/wmweather+ \
		XScreenSaver.App:${PORTSDIR}/x11/xscreensaver.app

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
