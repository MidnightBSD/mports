PORTNAME=	gamepad
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 Gamepad Module

BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto

USES=		compiler:c++11-lang perl5 qmake:norecursive qt-dist:5,gamepad
USE_PERL5=	build
USE_QT=		core declarative gui buildtools:build

# The sdl2 backend is auto-detected via pkg-config, so without an explicit
# switch the plugin is built only when sdl2 happens to be installed on the
# builder, and it is not in the packing list either way.  Pin the feature to
# the option so the package is reproducible.
OPTIONS_DEFINE=		SDL2
OPTIONS_SUB=		yes

SDL2_DESC=		SDL2 gamepad backend
SDL2_LIB_DEPENDS=	libSDL2.so:devel/sdl20
SDL2_VARS=		QMAKE_CONFIGURE_ARGS+=--feature-sdl2
SDL2_VARS_OFF=		QMAKE_CONFIGURE_ARGS+=--no-feature-sdl2

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
