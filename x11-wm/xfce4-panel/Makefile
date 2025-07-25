PORTNAME=	xfce4-panel
PORTVERSION=	4.20.4
CATEGORIES=	x11-wm xfce
MASTER_SITES=	XFCE
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce's panel
WWW=		https://gitlab.xfce.org/xfce/xfce4-panel

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libdbusmenu-gtk3.so:devel/libdbusmenu \
		libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 desktop-file-utils gettext-tools gmake gnome \
		libtool pathfix perl5 pkgconfig python:build shebangfix \
		tar:bzip2 xfce xorg
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 libwnck3
USE_LDCONFIG=	yes
USE_PERL5=	build
USE_XFCE=	garcon libexo windowing xdt xfconf
USE_XORG=	ice sm x11 xext

SHEBANG_FILES=	xdt-gen-visibility

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-x11 \
		--without-html-dir
INSTALL_TARGET=	install-strip

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=		GIR NLS VAPI WAYLAND
OPTIONS_DEFAULT=	GIR VAPI WAYLAND
OPTIONS_SUB=		yes

GIR_DESC=	Use Gobject Introspection

GIR_USE=		GNOME=introspection:build
GIR_CONFIGURE_ON=	--enable-introspection=yes
GIR_CONFIGURE_OFF=	--enable-introspection=no

NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

VAPI_IMPLIES=		GIR
VAPI_USES=		vala:build
VAPI_CONFIGURE_ENABLE=	vala

WAYLAND_LIB_DEPENDS=		libgtk-layer-shell.so:x11-toolkits/gtk-layer-shell \
				libwayland-client.so:graphics/wayland
WAYLAND_CONFIGURE_ENABLE=	gtk-layer-shell wayland

.include <bsd.port.mk>
