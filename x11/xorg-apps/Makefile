# $MidnightBSD: mports/x11/xorg-apps/Makefile,v 1.6 2011/05/13 14:35:21 laffer1 Exp $

PORTNAME=	xorg-apps
PORTVERSION=	7.5.1
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org apps meta-port
LICENSE=	x11

COMPONENTS=	appres bitmap xf86dga:dga iceauth luit \
		x11-fonts/mkfontdir:mkfontdir \
		x11-fonts/mkfontscale:mkfontscale sessreg \
		setxkbmap smproxy x11perf xauth xbacklight xcalc \
		xcmsdb xcursorgen xdpyinfo xdriinfo xev xgamma xgc \
		xhost xinput xkbcomp xkbevd xkbutils:xkbvleds xkill \
		xlsatoms xlsclients xmodmap xpr xprop xrandr xrdb \
		xrefresh xset xsetmode xsetroot xvinfo xwd xwininfo \
		xwud xmessage

# These three are added for convenience purposes only.
COMPONENTS+=	x11-wm/twm:twm x11-clocks/xclock:xclock xinit xterm

NO_BUILD=	yes

do-install:
		${MKDIR} ${PREFIX}/libdata/xorg
		${TOUCH} ${PREFIX}/libdata/xorg/apps

.for comp in ${COMPONENTS}
OPTIONS+=	${comp:C/:.*//:C/.*\///:U} "Install ${comp:C/:.*//:C/.*\///} application" on
.endfor

.include <bsd.port.pre.mk>

.for comp in ${COMPONENTS}
. if !defined(WITHOUT_${comp:C/:.*//:C/.*\///:U})
.  if ${comp:M:}==""
port=${comp}
check=${comp:C/.*\///} # doesn't work
.  else
port=${comp:C/:.*//}
check=${comp:C/.*://}
.  endif
.  if ${port:M*/*}==""
port:=x11/${port}
.  endif
RUN_DEPENDS:=	${RUN_DEPENDS} ${check}:${PORTSDIR}/${port}
. endif
.endfor

.include <bsd.port.post.mk>
