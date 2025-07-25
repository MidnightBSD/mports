PORTNAME=	cinnamon-desktop
PORTVERSION=	5.4.2
PORTREVISION=	5
CATEGORIES=	x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for cinnamon
WWW=		https://github.com/linuxmint/cinnamon-desktop

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	xkeyboard-config>=0:x11/xkeyboard-config \
		libxkbfile>=0:x11/libxkbfile
LIB_DEPENDS=	libpulse.so:audio/pulseaudio
RUN_DEPENDS=	xkeyboard-config>=0:x11/xkeyboard-config \
		libxkbfile>=0:x11/libxkbfile

USES=		gettext gnome localbase meson pkgconfig python:build shebangfix xorg
USE_GNOME=	cairo gdkpixbuf gtk30 intltool introspection
USE_XORG=	x11 xext xrandr
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

SHEBANG_FILES=	install-scripts/meson_install_schemas.py installer-test

GLIB_SCHEMAS=	org.cinnamon.desktop.a11y.applications.gschema.xml \
		org.cinnamon.desktop.a11y.keyboard.gschema.xml \
		org.cinnamon.desktop.a11y.magnifier.gschema.xml \
		org.cinnamon.desktop.a11y.mouse.gschema.xml \
		org.cinnamon.desktop.background.gschema.xml \
		org.cinnamon.desktop.default-applications.gschema.xml \
		org.cinnamon.desktop.enums.xml \
		org.cinnamon.desktop.input-sources.gschema.xml \
		org.cinnamon.desktop.interface.gschema.xml \
		org.cinnamon.desktop.keybindings.gschema.xml \
		org.cinnamon.desktop.keybindings.media-keys.gschema.xml \
		org.cinnamon.desktop.keybindings.wm.gschema.xml \
		org.cinnamon.desktop.lockdown.gschema.xml \
		org.cinnamon.desktop.media-handling.gschema.xml \
		org.cinnamon.desktop.notifications.gschema.xml \
		org.cinnamon.desktop.peripherals.gschema.xml \
		org.cinnamon.desktop.privacy.gschema.xml \
		org.cinnamon.desktop.screensaver.gschema.xml \
		org.cinnamon.desktop.session.gschema.xml \
		org.cinnamon.desktop.sound.gschema.xml \
		org.cinnamon.desktop.thumbnail-cache.gschema.xml \
		org.cinnamon.desktop.thumbnailers.gschema.xml \
		org.cinnamon.desktop.wm.preferences.gschema.xml

OPTIONS_DEFINE=	ALSA

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
ALSA_MESON_TRUE=	alsa

.include <bsd.port.mk>
