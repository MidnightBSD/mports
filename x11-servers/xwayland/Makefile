PORTNAME=	xwayland

COMMENT=	X Clients under Wayland

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/wayland-protocols.pc:graphics/wayland-protocols \
		${LOCALBASE}/include/linux/input.h:devel/evdev-proto
LIB_DEPENDS=	libwayland-client.so:graphics/wayland \
		libinput.so:x11/libinput

MASTERDIR=	${.CURDIR}/../xorg-server
DESCR=		${.CURDIR}/pkg-descr

SLAVE_PORT=	yes

USE_XORG=	x11 xext xfont2
USE_GL+=	egl gbm

CONFIGURE_ARGS+=	--disable-docs --disable-devel-docs \
			--enable-xwayland --disable-xorg --disable-xvfb --disable-xnest \
			--disable-xquartz --disable-xwin --with-default-xkb-ruleset=evdev

PLIST_FILES=	bin/Xwayland

OPTIONS_DEFINE=	NVIDIA                                                                                                                                            
NVIDIA_DESC=	EGLStream support for glamor on Xwayland                                                                                                          
NVIDIA_BUILD_DEPENDS=	egl-wayland>0:graphics/egl-wayland                                                                                                                
NVIDIA_CONFIGURE_ENABLE=xwayland-eglstream                                                                                                                              

do-install:
	cd ${WRKSRC}/hw/xwayland; DESTDIR=${STAGEDIR} ${MAKE_CMD} ${FAKE_MAKEARGS} install

.include "${MASTERDIR}/Makefile"
