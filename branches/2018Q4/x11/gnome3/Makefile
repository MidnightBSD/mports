# $MidnightBSD$

PORTNAME=	gnome3
PORTVERSION=	3.16.2
CATEGORIES?=	x11 gnome
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	The "meta-port" for the GNOME 3 integrated X11 desktop

LICENSE=	agg

CONFLICTS?=	gnome3-lite-[0-9]*

RUN_DEPENDS?=	dconf-editor:${PORTSDIR}/devel/dconf-editor \
		gnome-session>=3.0.0:${PORTSDIR}/x11/gnome-session \
		gnome-themes-standard>=3.0.0:${PORTSDIR}/x11-themes/gnome-themes-standard \
		gnome-icon-theme-extras>=3.0.0:${PORTSDIR}/misc/gnome-icon-theme-extras \
		gnome-icon-theme-symbolic>=3.0.0:${PORTSDIR}/x11-themes/gnome-icon-theme-symbolic \
		gnome-keyring>=3.0.0:${PORTSDIR}/security/gnome-keyring \
		gnome-power-manager>=3.0.0:${PORTSDIR}/sysutils/gnome-power-manager \
		orca>=3.0.0:${PORTSDIR}/accessibility/orca \
		gnome-mount:${PORTSDIR}/sysutils/gnome-mount \
		gnome-shell>=3.0.0:${PORTSDIR}/x11/gnome-shell \
		gnome-shell-extensions>=3.0.0:${PORTSDIR}/x11/gnome-shell-extensions \
		nautilus>=3.0.0:${PORTSDIR}/x11-fm/nautilus \
		${LOCALBASE}/lib/X11/fonts/bitstream-vera/Vera.ttf:${PORTSDIR}/x11-fonts/bitstream-vera \
		${LOCALBASE}/share/hal/fdi/information/10freedesktop/10-camera-ptp.fdi:${PORTSDIR}/sysutils/hal-info \
		yelp>=3.0.0:${PORTSDIR}/x11/yelp \
		zenity>=3.0.0:${PORTSDIR}/x11/zenity \
		gnome-control-center>=3.0.0:${PORTSDIR}/sysutils/gnome-control-center \
		${LOCALBASE}/share/gnome-background-properties/gnome-backgrounds.xml:${PORTSDIR}/x11-themes/gnome-backgrounds \
		caribou>=0:${PORTSDIR}/accessibility/caribou \
		${LOCALBASE}/share/help/C/gnome-help/index.page:${PORTSDIR}/misc/gnome-user-docs \
		${LOCALBASE}/share/sounds/freedesktop/index.theme:${PORTSDIR}/audio/freedesktop-sound-theme 

NO_BUILD=	yes
NO_MTREE=	yes

.if ${.CURDIR:T}!="gnome3-lite"
OPTIONS_DEFINE+=MAPI
MAPI_DESC=	Depend on evolution-mapi (pulls in samba4)
.endif

.include <bsd.mport.options.mk>

.if ${.CURDIR:T}!="gnome3-lite"
RUN_DEPENDS+=	epiphany>=3.0.0:${PORTSDIR}/www/epiphany \
		gucharmap>=3.0.0:${PORTSDIR}/deskutils/gucharmap \
		eog>=3.0.0:${PORTSDIR}/graphics/eog \
		gedit>=3.0.0:${PORTSDIR}/editors/gedit \
		gedit-plugins>=3.0.0:${PORTSDIR}/editors/gedit-plugins \
		gnome-terminal>=3.0.0:${PORTSDIR}/x11/gnome-terminal \
		mousetweaks>=3.0.0:${PORTSDIR}/accessibility/mousetweaks \
		brasero>=3.0.0:${PORTSDIR}/sysutils/brasero \
		gnome-utils>=3.6.0:${PORTSDIR}/deskutils/gnome-utils \
		file-roller>=3.0.0:${PORTSDIR}/archivers/file-roller \
		evince>=3.0.0:${PORTSDIR}/graphics/evince \
		vino>=3.0.0:${PORTSDIR}/net/vino \
		vinagre>=3.0.0:${PORTSDIR}/net/vinagre \
		totem>=3.0.0:${PORTSDIR}/multimedia/totem \
		gconf-editor>=3.0.0:${PORTSDIR}/sysutils/gconf-editor \
		gdm>=3.0.0:${PORTSDIR}/x11/gdm \
		evolution>=3.0.0:${PORTSDIR}/mail/evolution \
		cheese>=3.0.0:${PORTSDIR}/multimedia/cheese

.if ${PORT_OPTIONS:MMAPI}
RUN_DEPENDS+=	evolution-mapi>=3.0.0:${PORTSDIR}/mail/evolution-mapi
.endif
.endif # !gnome3-lite section

do-install:	# empty

.include <bsd.port.mk>
