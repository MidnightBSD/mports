PORTNAME=	marco
PORTVERSION=	1.28.1
CATEGORIES=	x11-wm mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window manager for the adult in you
WWW=		https://mate-desktop.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool \
		zenity>=3.0.0:x11/zenity
LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libgtop-2.0.so:devel/libgtop
RUN_DEPENDS=	zenity>=3.0.0:x11/zenity

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig \
		tar:xz xorg mate
USE_XORG=	ice sm x11 xcomposite xcursor xdamage xext xfixes \
		xinerama xrandr xrender xres
USE_GNOME=	cairo gdkpixbuf gtk30 intltool
USE_MATE=	desktop
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.mate.marco.gschema.xml

.include <bsd.port.mk>
