# $MidnightBSD: mports/x11/gnome2/Makefile,v 1.17 2011/05/31 00:24:46 laffer1 Exp $

PORTNAME=	gnome2
PORTVERSION=	2.32.1
PORTREVISION?=	2
CATEGORIES?=	x11 gnome
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	The "meta-port" for the GNOME 2 integrated X11 desktop
LICENSE=	agg

RUN_DEPENDS?=	${LOCALBASE}/libexec/gweather-applet-2:${PORTSDIR}/x11/gnome-applets \
		gnome-audio-profiles-properties:${PORTSDIR}/audio/gnome-media \
	 	gnome-dictionary:${PORTSDIR}/deskutils/gnome-utils \
		eog:${PORTSDIR}/graphics/eog \
		gconf-editor:${PORTSDIR}/sysutils/gconf-editor \
		gedit:${PORTSDIR}/editors/gedit \
		gnome-terminal:${PORTSDIR}/x11/gnome-terminal \
		gnome-session:${PORTSDIR}/x11/gnome-session \
		bug-buddy:${PORTSDIR}/devel/bug-buddy \
		gnome-system-monitor:${PORTSDIR}/sysutils/gnome-system-monitor \
		nautilus:${PORTSDIR}/x11-fm/nautilus \
		${LOCALBASE}/sbin/gdm:${PORTSDIR}/x11/gdm \
		${LOCALBASE}/share/gnome/help/user-guide/C/user-guide.xml:${PORTSDIR}/misc/gnome-user-docs \
		${LOCALBASE}/share/sounds/question.wav:${PORTSDIR}/audio/gnome-audio \
		file-roller:${PORTSDIR}/archivers/file-roller \
		${LOCALBASE}/share/themes/HighContrast/gtk-2.0/gtkrc:${PORTSDIR}/x11-themes/gnome-themes \
		gok:${PORTSDIR}/accessibility/gok \
		gcalctool:${PORTSDIR}/math/gcalctool \
		${LOCALBASE}/lib/X11/fonts/bitstream-vera/Vera.ttf:${PORTSDIR}/x11-fonts/bitstream-vera \
		${LOCALBASE}/libexec/gnome-netstatus-applet:${PORTSDIR}/net/gnome-netstatus \
		dasher:${PORTSDIR}/accessibility/dasher \
		evolution:${PORTSDIR}/mail/evolution \
		${LOCALBASE}/libexec/evolution-webcal:${PORTSDIR}/www/evolution-webcal \
		network-admin:${PORTSDIR}/sysutils/gnome-system-tools \
		vino-passwd:${PORTSDIR}/net/vino \
		exchange-connector-setup-2.32:${PORTSDIR}/mail/evolution-exchange \
		${LOCALBASE}/lib/gstreamer-0.10/.gstreamer-plugins-core.keep:${PORTSDIR}/multimedia/gstreamer-plugins-core \
		${LOCALBASE}/lib/gstreamer-0.10/libgstgconfelements.so:${PORTSDIR}/devel/gstreamer-plugins-gconf \
		totem:${PORTSDIR}/multimedia/totem \
		gnome-control-center:${PORTSDIR}/sysutils/gnome-control-center \
		${LOCALBASE}/share/gnome-background-properties/gnome-nature.xml:${PORTSDIR}/x11-themes/gnome-backgrounds \
		evince:${PORTSDIR}/graphics/evince \
		gnome-power-manager:${PORTSDIR}/sysutils/gnome-power-manager \
		orca:${PORTSDIR}/accessibility/orca \
		gnome-mount:${PORTSDIR}/sysutils/gnome-mount \
		${LOCALBASE}/libexec/notification-daemon:${PORTSDIR}/deskutils/notification-daemon \
		mousetweaks:${PORTSDIR}/accessibility/mousetweaks \
		${LOCALBASE}/share/hal/fdi/information/10freedesktop/10-camera-ptp.fdi:${PORTSDIR}/sysutils/hal-info \
		${LOCALBASE}/share/sounds/freedesktop/index.theme:${PORTSDIR}/audio/freedesktop-sound-theme

NO_BUILD=	yes

.if !defined(GNOME_SLAVE)
USE_PYTHON=	yes
.endif

.if !defined(GNOME_SLAVE) || ${.CURDIR:T}=="gnome2-lite"
OPTIONS=	XSCREENSAVER "Use xscreensaver as screen saver app" off \
		MAPI "Depend on evolution-mapi (pulls in samba4)" on
.endif

do-install:	# empty

.include <bsd.port.pre.mk>

.if !defined(GNOME_SLAVE)
.if (${ARCH}!="sparc64")
RUN_DEPENDS+=	yelp:${PORTSDIR}/x11/yelp \
		epiphany:${PORTSDIR}/www/epiphany
.endif
.if ${.CURDIR:T}!="gnome2-lite"
RUN_DEPENDS+=	\
		gucharmap:${PORTSDIR}/deskutils/gucharmap \
		sound-juicer:${PORTSDIR}/audio/sound-juicer \
		zenity:${PORTSDIR}/x11/zenity \
		gnome-nettool:${PORTSDIR}/net/gnome-nettool \
		vinagre:${PORTSDIR}/net/vinagre \
		brasero:${PORTSDIR}/sysutils/brasero \
		gnome-file-share-properties:${PORTSDIR}/www/gnome-user-share \
		${LOCALBASE}/libexec/deskbar-applet/deskbar-applet:${PORTSDIR}/deskutils/deskbar-applet \
		${LOCALBASE}/lib/hamster-applet/hamster-applet:${PORTSDIR}/deskutils/hamster-applet \
		${LOCALBASE}/lib/gtk-2.0/modules/libatk-bridge.so:${PORTSDIR}/accessibility/at-spi
.if defined(WITH_MAPI)
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/libexchangemapi-1.0.pc:${PORTSDIR}/mail/evolution-mapi
.endif
.endif
.endif

.if ${.CURDIR}==${MASTERDIR} || ${.CURDIR:T}=="gnome2-lite"
.if defined(WITH_XSCREENSAVER)
RUN_DEPENDS+=	${LOCALBASE}/share/applications/xscreensaver-properties.desktop:${PORTSDIR}/x11/xscreensaver-gnome
.else
RUN_DEPENDS+=	gnome-screensaver:${PORTSDIR}/x11/gnome-screensaver
.endif
.endif

.include <bsd.port.post.mk>
