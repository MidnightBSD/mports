PORTNAME=	zenity
PORTVERSION=	3.42.1
PORTREVISION=	3
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display GNOME dialogs from the command line

LICENSE=	lgpl

BUILD_DEPENDS=	itstool:textproc/itstool

USES=		gettext gnome localbase meson pkgconfig \
		perl5 tar:xz xorg
USE_CSTD=	c99
USE_GNOME=	cairo gdkpixbuf gtk30 intlhack
USE_XORG=	x11
MESON_ARGS=	-Dwebkitgtk=false

OPTIONS_DEFINE=	NOTIFY
OPTIONS_DEFAULT=NOTIFY
NOTIFY_LIB_DEPENDS=	libnotify.so:devel/libnotify
NOTIFY_MESON_TRUE=	libnotify

.include <bsd.port.mk>
