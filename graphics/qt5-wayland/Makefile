PORTNAME=	wayland
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	graphics wayland
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt5 wrapper for Wayland

BUILD_DEPENDS=	${LOCALBASE}/include/libdrm/drm_fourcc.h:graphics/libdrm
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libwayland-egl.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c++11-lang gl gnome perl5 pkgconfig qmake:norecursive \
		qt-dist:5,wayland xorg
USE_GL=		egl gl
USE_GNOME=	glib20
USE_PERL5=	build
USE_QT=		core dbus gui declarative \
		buildtools:build qmake:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}
USE_XORG=	x11 xcomposite

QT_BINARIES=	yes

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
