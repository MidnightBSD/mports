PORTNAME=	hikari
DISTVERSION=	2.3.2
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	https://hikari.acmelabs.space/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stacking Wayland compositor with tiling capabilities

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
		wayland-protocols>=1.14:graphics/wayland-protocols \
		wlroots>=0.14.0<0.15.0:x11-toolkits/wlroots
LIB_DEPENDS=	libinput.so:x11/libinput \
		libucl.so:textproc/libucl \
		libwayland-server.so:graphics/wayland \
		libwlroots.so:x11-toolkits/wlroots \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c11 gnome pkgconfig xorg
USE_GNOME=	cairo pango
USE_XORG=	pixman

MAKE_ARGS+=	${WITH_DEBUG:DDEBUG=YES}

OPTIONS_DEFINE=		GAMMA LAYERSHELL SCREENCOPY VIRTUALINPUT X11
OPTIONS_DEFAULT=	GAMMA LAYERSHELL SCREENCOPY VIRTUALINPUT X11

GAMMA_DESC=		Include gammacontrol protocol (required by, e.g., Redshift)
LAYERSHELL_DESC=	Include layer_shell protocol (required by, e.g., waybar)
SCREENCOPY_DESC=	Include screenshot protocol (required by, e.g., grim)
VIRTUALINPUT_DESC=	needed for VNC support (requiered by e.g. wayvnc)

GAMMA_MAKE_ARGS=	WITH_GAMMACONTROL=YES
LAYERSHELL_MAKE_ARGS=	WITH_LAYERSHELL=YES
SCREENCOPY_MAKE_ARGS=	WITH_SCREENCOPY=YES
VIRTUALINPUT_MAKE_ARGS=	WITH_VIRTUAL_INPUT=YES
X11_MAKE_ARGS=		WITH_XWAYLAND=YES

post-patch:
	${LN} -sf ${WRKSRC}/etc/pam.d/hikari-unlocker.FreeBSD  ${WRKSRC}/etc/pam.d/hikari-unlocker.MidnightBSD 

post-install:
.ifndef WITH_DEBUG
	-${STRIP_CMD} ${PREFIX}/bin/hikari
	-${STRIP_CMD} ${PREFIX}/bin/hikari-unlocker
.endif
	-${MV} ${ETCDIR}/hikari.conf \
		${ETCDIR}/hikari.conf.sample

.include <bsd.port.mk>
