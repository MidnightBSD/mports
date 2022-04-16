# Created by: Alexander Nedotsukov <bland@FreeBSD.org>

PORTNAME=	nvidia-settings
PORTVERSION=	470.86
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display Control Panel for X NVidia driver

LICENSE=	gpl2

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	${LOCALBASE}/include/dbus-1.0/dbus/dbus.h:devel/dbus
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libjansson.so:devel/jansson \
		libvdpau.so:multimedia/libvdpau

USES=		gl gmake gnome pkgconfig gettext-runtime xorg
USE_GNOME=	gtk20 cairo gdkpixbuf2
USE_GL=		gl
USE_XORG=	x11 xext xv xxf86vm

USE_GITHUB=	yes
GH_ACCOUNT=	NVIDIA

PLIST_FILES=	bin/nvidia-settings \
		libexec/nvidia-settings \
		man/man1/nvidia-settings.1.gz \
		lib/libnvidia-gtk2.so.${PORTVERSION} \
		share/applications/nvidia-settings.desktop \
		share/pixmaps/nvidia-settings.png

SUB_FILES=	nvidia-settings

LDFLAGS+=	-pthread
LLD_UNSAFE=	yes
MAKE_ENV=	NV_USE_BUNDLED_LIBJANSSON=0 \
		NV_VERBOSE=1 \
		GTK3_AVAILABLE=0 \
		INSTALL_DOC_ARGS="${INSTALL_MAN:Ninstall}" \
		XNVCTRL_CFLAGS=-I${LOCALBASE}/include \
		XNVCTRL_LDFLAGS=-L${LOCALBASE}/lib

post-patch:	.SILENT
	${REINPLACE_CMD} -e '/^MANDIR/s|share/||' ${WRKSRC}/utils.mk
	${REINPLACE_CMD} -E -e 's,__(PIXMAP|UTILS)_PATH__/,,' \
		-e 's|__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__|Settings;HardwareSettings;|' \
		${WRKSRC}/doc/nvidia-settings.desktop
	${REINPLACE_CMD} -e 's|/usr/share/nvidia/|${LOCALBASE}/share/doc/NVIDIA_GLX-1.0/|' \
		${WRKSRC}/src/gtk+-2.x/ctkappprofile.c

post-install:	.SILENT
	${STRIP_CMD} ${PREFIX}/lib/libnvidia-gtk2.so.${PORTVERSION}
	${INSTALL_DATA} ${WRKSRC}/doc/nvidia-settings.desktop \
		/${DESKTOPDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/nvidia-settings.png \
		/${PREFIX}/share/pixmaps
	${MV} ${PREFIX}/bin/nvidia-settings \
		${PREFIX}/libexec/nvidia-settings
	${INSTALL} ${WRKDIR}/nvidia-settings \
		${PREFIX}/bin/nvidia-settings

.include <bsd.port.mk>
