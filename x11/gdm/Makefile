# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	gdm
PORTVERSION=	42.0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 display manager

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	iso-codes>=0:misc/iso-codes \
		itstool:textproc/itstool \
		zenity>=3.0.0:x11/zenity
LIB_DEPENDS=	libaccountsservice.so:sysutils/accountsservice \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libcanberra.so:audio/libcanberra \
		libck-connector.so:sysutils/consolekit2 \
		libfribidi.so:converters/fribidi
RUN_DEPENDS=	at-spi2-core>=0:accessibility/at-spi2-core \
		gnome-icon-theme-symbolic>=0:x11-themes/gnome-icon-theme-symbolic \
		gnome-keyring-3:security/gnome-keyring \
		gnome-session>=3.0.0:x11/gnome-session \
		gnome-settings-daemon>=3.0.0:sysutils/gnome-settings-daemon \
		iso-codes>=0:misc/iso-codes \
		polkit-gnome>=0.105:sysutils/polkit-gnome \
		zenity>=3.0.0:x11/zenity
# used in scripts
RUN_DEPENDS+=	setxkbmap:x11/setxkbmap \
		xhost:x11/xhost \
		xmodmap:x11/xmodmap \
		xrdb:x11/xrdb \
		xsetroot:x11/xsetroot \
		xterm:x11/xterm

USERS=		gdm
GROUPS=		gdm video

PORTSCOUT=	limitw:1,even

USES=		cpe gettext gnome libtool localbase:ldflags meson pathfix \
		pkgconfig tar:xz xorg
CPE_VENDOR=	gnome
CPE_PRODUCT=	gnome_display_manager
USE_GNOME=	cairo dconf gtk30 intltool introspection
USE_LDCONFIG=	yes
USE_XORG=	x11 xau xcb xdmcp xorgproto
INSTALLS_ICONS=	yes
USE_RC_SUBR=	gdm
USE_GNOME_SUBR=	yes
GLIB_SCHEMAS=	org.gnome.login-screen.gschema.xml
MESON_ARGS=	-Dat-spi-registryd-dir=${PREFIX}/libexec \
		-Dcustom-conf=${PREFIX}/etc/gdm/custom.conf \
		-Ddbus-sys=${PREFIX}/etc/dbus-1/system.d \
		-Ddefault-pam-config=none \
		-Ddmconfdir=${PREFIX}/share/xsessions \
		-Dgdm-xsession=true \
		-Dgroup=gdm \
		-Dinitial-vt=09 \
		-Dlang-file=${PREFIX}/etc/gdm/locale.conf \
		-Dlibaudit=disabled \
		-Dlog-dir=/var/log/gdm \
		-Dpid-file=/var/run/gdm.pid \
		-Dplymouth=disabled \
		-Dscreenshot-dir=/var/run/gdm/greeter \
		-Dselinux=disabled \
		-Dsysconfsubdir=gdm \
		-Dsystemd-journal=false \
		-Duser-display-server=false \
		-Duser=gdm \
		-Dwayland-support=false \
		-Dworking-dir=/var/db/gdm \
		-Dxauth-dir=/var/run/gdm

# this is a hack until we can get our own pam dir and dir in order.
CPPFLAGS+=	-DHAS_SA_LEN -DWITH_CONSOLE_KIT=1
INSTALL_TARGET=	install-strip

SUB_FILES+=	client.conf gdm-autologin gdm-launch-environment gdm-password \
		locale.conf

GDMDIR?=	${PREFIX}/etc/gdm

GNOME_LOCALSTATEDIR=	/var

OPTIONS_DEFINE=	IPV6

IPV6_MESON_ENABLE=	ipv6

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		-e 's|/bin/bash|/bin/sh|g' \
		${WRKSRC}/daemon/gdm-session-worker.c
	@${REINPLACE_CMD} -e 's|/usr/X11R6|${LOCALBASE}|g' \
		-e 's|/usr/bin/X|${LOCALBASE}/bin/X|g' \
		-e 's|/usr/bin/Xorg|${LOCALBASE}/bin/Xorg|g' \
		${WRKSRC}/meson.build ${WRKSRC}/daemon/*.c ${WRKSRC}/po/*.po
	@${REINPLACE_CMD} -e 's|/at-spi-registryd|/at-spi2-registryd|g' \
		${WRKSRC}/chooser/gdm-host-chooser.c \
		${WRKSRC}/chooser/chooser-main.c
	@${REINPLACE_CMD} -e 's|/etc/X11|${LOCALBASE}/etc/X11|g' \
		${WRKSRC}/data/Init.in \
		${WRKSRC}/data/PostLogin \
		${WRKSRC}/data/PostSession.in \
		${WRKSRC}/data/PreSession.in \
		${WRKSRC}/data/Xsession.in
	@${RM}	${WRKSRC}/data/applications/gdm-simple-greeter.desktop \
		${WRKSRC}/data/applications/gdm-simple-greeter.desktop.in \
		${WRKSRC}/data/applications/gnome-shell.desktop \

post-install:
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/custom.conf \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/custom.conf.sample
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/PostSession/Default \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/PostSession/Default.sample
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/PreSession/Default \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/PreSession/Default.sample
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/Init/Default \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/Init/Default.sample
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/Xsession \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/Xsession.sample
	${MV} ${FAKE_DESTDIR}${PREFIX}/etc/dbus-1/system.d/gdm.conf \
		${FAKE_DESTDIR}${PREFIX}/etc/dbus-1/system.d/gdm.conf.sample

	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/xsessions
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/Sessions
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/dm/Sessions

	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/home
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/gdm/home/.pulse/

	${INSTALL_DATA} ${WRKDIR}/gdm-autologin \
		${FAKE_DESTDIR}${PREFIX}/etc/pam.d/gdm-autologin.sample
	${INSTALL_DATA} ${WRKDIR}/gdm-launch-environment \
		${FAKE_DESTDIR}${PREFIX}/etc/pam.d/gdm-launch-environment.sample
	${INSTALL_DATA} ${WRKDIR}/gdm-password \
		${FAKE_DESTDIR}${PREFIX}/etc/pam.d/gdm-password.sample

	${INSTALL_DATA} ${WRKDIR}/client.conf \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/home/.pulse/client.conf.sample

	${INSTALL_DATA} ${WRKDIR}/locale.conf \
		${FAKE_DESTDIR}${PREFIX}/etc/gdm/locale.conf.sample

	${MKDIR} ${FAKE_DESTDIR}/var/cache/gdm
	${MKDIR} ${FAKE_DESTDIR}/var/log/gdm
	${MKDIR} ${FAKE_DESTDIR}/var/run/gdm
	${MKDIR} ${FAKE_DESTDIR}/var/run/gdm/greeter

	@${RM} ${FAKE_DESTDIR}${PREFIX}/lib/udev/rules.d/61-gdm.rules
	@${RMDIR} ${FAKE_DESTDIR}${PREFIX}/lib/udev/rules.d
	@${RMDIR} ${FAKE_DESTDIR}${PREFIX}/lib/udev

.include <bsd.port.mk>
