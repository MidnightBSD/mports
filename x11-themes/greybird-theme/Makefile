PORTNAME=	greybird
PORTVERSION=	3.23.4
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-themes xfce
PKGNAMESUFFIX=	-theme

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk and xfwm4 themes for the Xfce Desktop
WWW=		https://github.com/shimmerproject/Greybird

LICENSE=	gpl2 CC-BY-SA-3.0
LICENSE_COMB=	dual

BUILD_DEPENDS=	sassc:textproc/sassc
RUN_DEPENDS=	gtk-murrine-engine>=0.98.1:x11-themes/gtk-murrine-engine

USES=		gnome meson pkgconfig python:build
USE_GNOME=	gdkpixbuf:build glib20:build librsvg2:build

GH_ACCOUNT=	shimmerproject
GH_PROJECT=	Greybird

USE_GITHUB=	yes
NO_BUILD=	yes
NO_ARCH=	yes

OPTIONS_DEFINE=		NOTIFYD
OPTIONS_DEFAULT=	NOTIFYD
OPTIONS_SUB=		yes

NOTIFYD_DESC=	Install xfce4-notifyd theme

post-patch-NOTIFYD-off:
	${REINPLACE_CMD} -e 's|install_data(xfce_notify_|#install_data(xfce_notify_|g' \
		${WRKSRC}/light/meson.build

.include <bsd.port.mk>
