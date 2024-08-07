PORTNAME=	xorg-apps
PORTVERSION=	7.7
PORTREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org apps meta-port

LICENSE=	mit

COMPONENTS=	appres bitmap xf86dga:dga iceauth \
		x11-fonts/mkfontscale:mkfontscale sessreg \
		setxkbmap smproxy x11perf xauth xbacklight xcalc \
		xcmsdb xconsole xcursorgen xdpyinfo xdriinfo xev xgamma xgc \
		xhost xinput xkbcomp xkbevd xkbutils:xkbvleds xkill \
		xlsatoms xlsclients xmodmap xpr xprop xrandr xrdb \
		xrefresh xset xsetroot xvinfo xwd xwininfo \
		xwud xmessage

# These three are added for convenience purposes only.
COMPONENTS+=	x11-wm/twm:twm x11-clocks/xclock:xclock xinit xterm

NO_BUILD=	yes

do-install:
		${MKDIR} ${PREFIX}/libdata/xorg
		${TOUCH} ${PREFIX}/libdata/xorg/apps

.for comp in ${COMPONENTS}
OPTIONS_DEFINE+=	${comp:C/:.*//:C/.*\///:tu}
OPTIONS_DEFAULT+=	${comp:C/:.*//:C/.*\///:tu}
${comp:C/:.*//:C/.*\///:tu}_DESC=	Install ${comp:C/:.*//:C/.*\///} application
.endfor

.include <bsd.mport.options.mk>

.for comp in ${COMPONENTS}
. if ${PORT_OPTIONS:M${comp:C/:.*//:C/.*\///:tu}}
.  if ${comp:M*\:*}==""
port=${comp}
check=${comp:C/.*\///} # doesn't work
.  else
port=${comp:C/:.*//}
check=${comp:C/.*://}
.  endif
.  if ${port:M*/*}==""
port:=x11/${port}
.  endif
RUN_DEPENDS:=	${RUN_DEPENDS} ${check}:${port}
. endif
.endfor

.include <bsd.port.mk>
