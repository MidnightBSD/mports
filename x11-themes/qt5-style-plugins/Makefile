PORTNAME=	qt5-style-plugins
DISTVERSIONPREFIX=	v
DISTVERSION=	5.0.0-23
DISTVERSIONSUFFIX=	-g335dbe
PORTREVISION=	6
CATEGORIES=	x11-themes
DIST_SUBDIR=	KDE/Qt/addons

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional Styles for Qt 5 and KDE
WWW=		https://qt-project.org

LICENSE=	lgpl2.1

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USES=		compiler:c++11-lang gettext-runtime gl gnome pkgconfig qmake \
		qt:5 xorg
USE_GITHUB=	yes
GH_ACCOUNT=	qt
GH_PROJECT=	qtstyleplugins
USE_GNOME=	atk cairo gdkpixbuf glib20 gtk20 pango
USE_QT=		core dbus gui widgets buildtools:build
USE_GL=		gl
USE_XORG=	x11 xext

.include <bsd.port.mk>
