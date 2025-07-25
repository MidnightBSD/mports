PORTNAME=	gnome-shell-extensions
PORTVERSION=	42.3
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME desktop shell extensions

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	sassc:textproc/sassc
LIB_DEPENDS=	libgjs.so:lang/gjs
RUN_DEPENDS=	gnome-shell>=42.0:x11/gnome-shell

PORTSCOUT=	limitw:1,even

NO_ARCH=	yes
USES=		gettext gnome meson pkgconfig python tar:xz
USE_GNOME=	glib20 gnomedesktop3
USE_LDCONFIG=	yes
MESON_ARGS=	-Dextension_set=all \
		-Dclassic_mode=true
BINARY_ALIAS=	python3=${PYTHON_CMD}

GLIB_SCHEMAS=	00_org.gnome.shell.extensions.classic.gschema.override \
		org.gnome.shell.extensions.auto-move-windows.gschema.xml \
		org.gnome.shell.extensions.native-window-placement.gschema.xml \
		org.gnome.shell.extensions.screenshot-window-sizer.gschema.xml \
		org.gnome.shell.extensions.user-theme.gschema.xml \
		org.gnome.shell.extensions.window-list.gschema.xml

.include <bsd.port.mk>
