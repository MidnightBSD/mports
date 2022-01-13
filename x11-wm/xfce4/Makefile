PORTNAME=	xfce
PORTVERSION=	4.16
CATEGORIES=	x11-wm xfce
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port for the Xfce Desktop Environment

LICENSE=	agg

RUN_DEPENDS=	xfwm4:x11-wm/xfce4-wm \
		xfce4-session:x11-wm/xfce4-session \
		xfce4-panel:x11-wm/xfce4-panel \
		xfdesktop:x11-wm/xfce4-desktop \
		xfsettingsd:sysutils/xfce4-settings

OPTIONS_DEFINE=		APPFINDER GDM GREYBIRD ICONS LIGHTDM MOUSEPAD NOTIFY \
			TERMINAL XPM
OPTIONS_DEFAULT=	APPFINDER GREYBIRD ICONS MOUSEPAD NOTIFY TERMINAL \
			XPM
APPFINDER_RUN_DEPENDS=	xfce4-appfinder:misc/xfce4-appfinder
APPFINDER_DESC=		Launcher and finder
GREYBIRD_DESC=		Install Greybird theme
GREYBIRD_RUN_DEPENDS=	greybird-theme>0:x11-themes/greybird-theme
ICONS_RUN_DEPENDS=	adwaita-icon-theme>0:x11-themes/adwaita-icon-theme
LIGHTDM_RUN_DEPENDS=	lightdm-gtk-greeter:x11/lightdm-gtk-greeter
LIGHTDM_DESC=		LightDM display manger
MOUSEPAD_RUN_DEPENDS=	mousepad:editors/mousepad
MOUSEPAD_DESC=		Text editor
NOTIFY_RUN_DEPENDS=	xfce4-notifyd-config:deskutils/xfce4-notifyd
TERMINAL_RUN_DEPENDS=	xfce4-terminal:x11/xfce4-terminal
TERMINAL_DESC=		Terminal emulator
XPM_RUN_DEPENDS=	xfce4-power-manager:sysutils/xfce4-power-manager
XPM_DESC=		Power manager

NO_BUILD=	yes

.include <bsd.mport.options.mk>

.if exists(${LOCALBASE}/sbin/gdm)
WITH_GDM=	yes
.endif

.if ${PORT_OPTIONS:MGDM}
RUN_DEPENDS+=	${LOCALBASE}/sbin/gdm:x11/gdm
PLIST_FILES=	etc/gdm/Sessions/XFce4 \
		etc/dm/Sessions/XFce4.desktop
PLIST_DIRS=	etc/gdm/Sessions
PLIST_SUB+=	GDM=""
.else
PLIST_SUB+=	GDM="@comment "
.endif

do-install:	# empty

post-install:
.if ${PORT_OPTIONS:MGDM}
	${MKDIR} -p ${PREFIX}/etc/gdm/Sessions
	@${INSTALL_SCRIPT} ${FILESDIR}/XFce4 ${PREFIX}/etc/gdm/Sessions
	@${SED} -e 's|%%PREFIX%%|${PREFIX}|' ${FILESDIR}/XFce4.desktop > ${PREFIX}/etc/dm/Sessions/XFce4.desktop
.endif
	@${ECHO}
	@${ECHO} "If you want to allow users to restart or shutdown the system,"
	@${ECHO} "do not forget to add the following lines between the <config>"
	@${ECHO} "tags in your PolicyKit.conf file."
	@${ECHO} "  ${PREFIX}/etc/PolicyKit/PolicyKit.conf"
	@${ECHO} ""
	@${ECHO} "<match action=\"org.freedesktop.hal.power-management.shutdown\">"
	@${ECHO} "    <return result=\"yes\"/>"
	@${ECHO} "</match>"
	@${ECHO} ""
	@${ECHO} "<match action=\"org.freedesktop.hal.power-management.reboot\">"
	@${ECHO} "    <return result=\"yes\"/>"
	@${ECHO} "</match>"
	@${ECHO}
	@${ECHO} "Make also sure, hald_enable, dbus_enable"
	@${ECHO} "is set to YES in your /etc/rc.conf"


.include <bsd.port.mk>
