PORTNAME=	tint2
DISTVERSION=	17.0.2
PORTREVISION=	0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight freedesktop-compliant panel/taskbar/systray/clock
WWW=		https://gitlab.com/o9000/tint2

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libImlib2.so:graphics/imlib2 \
		libstartup-notification-1.so:x11/startup-notification

USES=		alias cmake desktop-file-utils gettext-runtime gnome pkgconfig \
		shared-mime-info xorg
USE_GNOME=	cairo glib20 gtk30 librsvg2 pango
USE_XORG=	x11 xcomposite xdamage xext xfixes xinerama xrandr xrender
INSTALLS_ICONS=	yes

CMAKE_ARGS=	-DMANDIR:PATH=man \
		-DSYSCONFDIR:PATH=etc

OPTIONS_DEFINE=		DOCS NLS
OPTIONS_SUB=		yes
NLS_USES=		gettext
NLS_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_Gettext

USE_GITLAB=	yes
GL_ACCOUNT=	o9000

.include <bsd.port.mk>
