# New ports collection makefile for: windowmaker-desktop
# Date created:	8 March 2007
# Whom:			Lucas Holt
#

#

PORTNAME=	windowmaker-desktop
PORTVERSION=	1.6
CATEGORIES=	x11 windowmaker
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        WindowMaker based desktop environment
LICENSE=	agg

RUN_DEPENDS=	wmaker:x11-wm/windowmaker \
		wdm:x11/wdm \
		wmBinClock:x11-clocks/wmbinclock \
		wmCalClock:x11-clocks/wmcalclock \
		wmmp3:audio/wmmp3 \
		wmsmixer:audio/wmsmixer \
		${LOCALBASE}/share/WindowMaker/Themes/LeetWM.themed/style:graphics/wmicons \
		wmweather+:misc/wmweather+ \
		XScreenSaver.App:x11/xscreensaver.app

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/share/xsessions ${PREFIX}/etc/X11/xinit
	${CP} ${FILESDIR}/windowmaker.desktop ${PREFIX}/share/xsessions/

.include <bsd.port.mk>
