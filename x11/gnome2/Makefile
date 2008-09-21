# New ports collection makefile for:	gnome2
# Date created:		Sun Nov  4 11:17:58 EST 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11/gnome2/Makefile,v 1.7 2008/09/21 19:44:26 laffer1 Exp $
#

PORTNAME=	gnome2
PORTVERSION=	2.22.0
PORTREVISION?=	0
CATEGORIES?=	x11 gnome
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	The "meta-port" for the GNOME 2 integrated X11 desktop
LICENSE=	agg

.if (${.CURDIR:T}!="gnome2-lite")
BROKEN=	Missing dependancies
.endif

# Missing RUN DEPENDS:
# gnect:${PORTSDIR}/games/gnome-games \
# ${LOCALBASE}/libexec/evolution-webcal:${PORTSDIR}/www/evolution-webcal \
# exchange-connector-setup-2.12:${PORTSDIR}/mail/evolution-exchange
# ino-session:${PORTSDIR}/net/vino \
# {LOCALBASE}/lib/gstreamer-0.10/.gstreamer-plugins-core.keep:${PORTSDIR}/multimedia/gstreamer-p
#lugins-core \
# alacarte:${PORTSDIR}/deskutils/alacarte \
#   dasher:${PORTSDIR}/accessibility/dasher \
# seahorse:${PORTSDIR}/security/seahorse
#             gnome-volume-manager:${PORTSDIR}/sysutils/gnome-volume-manager \
# network-admin:${PORTSDIR}/sysutils/gnome-system-tools \

RUN_DEPENDS?=	${LOCALBASE}/libexec/gweather-applet-2:${PORTSDIR}/x11/gnome-applets \
		${LOCALBASE}/lib/deskbar-applet/deskbar-applet:${PORTSDIR}/deskutils/deskbar-applet \
		gnome-cd:${PORTSDIR}/audio/gnome-media \
	 	gnome-dictionary:${PORTSDIR}/deskutils/gnome-utils \
		eog:${PORTSDIR}/graphics/eog \
		bug-buddy:${PORTSDIR}/devel/bug-buddy \
		gconf-editor:${PORTSDIR}/sysutils/gconf-editor \
		gedit:${PORTSDIR}/editors/gedit \
		gnome-nettool:${PORTSDIR}/net/gnome-nettool \
		${LOCALBASE}/libexec/gnome-netstatus-applet:${PORTSDIR}/net/gnome-netstatus \
		gnome-terminal:${PORTSDIR}/x11/gnome-terminal \
		gnome-session:${PORTSDIR}/x11/gnome-session \
		gnome-system-monitor:${PORTSDIR}/sysutils/gnome-system-monitor \
		nautilus:${PORTSDIR}/x11-fm/nautilus \
		${LOCALBASE}/sbin/gdm:${PORTSDIR}/x11/gdm \
		${LOCALBASE}/share/gnome/help/user-guide/C/user-guide.xml:${PORTSDIR}/misc/gnome-user-docs \
		${LOCALBASE}/share/sounds/question.wav:${PORTSDIR}/audio/gnome-audio \
		${LOCALBASE}/libdata/pkgconfig/libgail-gnome.pc:${PORTSDIR}/x11-toolkits/libgail-gnome \
		file-roller:${PORTSDIR}/archivers/file-roller \
		${LOCALBASE}/share/themes/HighContrast/gtk-2.0/gtkrc:${PORTSDIR}/x11-themes/gnome-themes \
		gok:${PORTSDIR}/accessibility/gok \
		nautilus-cd-burner:${PORTSDIR}/sysutils/nautilus-cd-burner \
		gcalctool:${PORTSDIR}/math/gcalctool \
		gucharmap:${PORTSDIR}/deskutils/gucharmap \
		zenity:${PORTSDIR}/x11/zenity \
		${LOCALBASE}/lib/X11/fonts/bitstream-vera/Vera.ttf:${PORTSDIR}/x11-fonts/bitstream-vera \
		${LOCALBASE}/lib/gstreamer-0.10/libgstgconfelements.so:${PORTSDIR}/devel/gstreamer-plugins-gconf \
		totem:${PORTSDIR}/multimedia/totem \
		gnome-control-center:${PORTSDIR}/sysutils/gnome-control-center \
		${LOCALBASE}/share/gnome-background-properties/gnome-branded.xml:${PORTSDIR}/x11-themes/gnome-backgrounds \
		sound-juicer:${PORTSDIR}/audio/sound-juicer \
		gnome-keyring-manager:${PORTSDIR}/security/gnome-keyring-manager \
		${LOCALBASE}/libdata/pkgconfig/libgtkhtml-2.0.pc:${PORTSDIR}/www/libgtkhtml \
		evince:${PORTSDIR}/graphics/evince \
		${LOCALBASE}/libexec/fast-user-switch-applet:${PORTSDIR}/x11/fast-user-switch-applet \
		orca:${PORTSDIR}/accessibility/orca \
		gnome-mount:${PORTSDIR}/sysutils/gnome-mount \
		${LOCALBASE}/libexec/notification-daemon:${PORTSDIR}/deskutils/notification-daemon \
		gnome-power-manager:${PORTSDIR}/sysutils/gnome-power-manager \
		evolution:${PORTSDIR}/mail/evolution

NO_BUILD=	yes

.if !defined(GNOME_SLAVE)
USE_PYTHON=	yes
.endif

#invert gnome2 lite check when fixed
#.if !defined(GNOME_SLAVE) || ${.CURDIR:T}!="gnome2-lite"
#OPTIONS=	XSCREENSAVER "Use xscreensaver as screen saver app" off
#.endif

do-install:	# empty

.include <bsd.port.pre.mk>

.if !defined(GNOME_SLAVE)
.if (${ARCH}!="sparc64")
RUN_DEPENDS+=	yelp:${PORTSDIR}/x11/yelp \
		epiphany:${PORTSDIR}/www/epiphany
.endif
#.if ${.CURDIR:T}!="gnome2-lite"
#.if ${ARCH} == "i386"
#RUN_DEPENDS+=	tomboy:${PORTSDIR}/deskutils/tomboy
#.endif
# needs evolution..
#RUN_DEPENDS+=	ekiga:${PORTSDIR}/net/ekiga
#.endif
.endif

#.if ${.CURDIR}==${MASTERDIR} || ${.CURDIR:T}=="gnome2-lite"
#.if defined(WITH_XSCREENSAVER)
#RUN_DEPENDS+=	${LOCALBASE}/share/applications/gnome-screensaver-properties.desktop:${PORTSDIR}/x11/xscreensaver-gnome
#.else
#RUN_DEPENDS+=	gnome-screensaver:${PORTSDIR}/x11/gnome-screensaver
#.endif
#.endif

.include <bsd.port.post.mk>
