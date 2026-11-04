PORTNAME=	zenity
PORTVERSION=	4.2.2
PORTREVISION=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display GNOME dialogs from the command line
WWW=		https://gitlab.gnome.org/GNOME/zenity

LICENSE=	lgpl2.1+

BUILD_DEPENDS=	itstool:textproc/itstool

USES=		gettext gnome localbase meson pkgconfig \
		perl5 tar:xz
USE_CSTD=	c99
USE_GNOME=	cairo gdkpixbuf libadwaita
MESON_ARGS=	-Dwebkitgtk=false
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
