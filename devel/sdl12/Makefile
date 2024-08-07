PORTNAME=	sdl
PORTVERSION=	1.2.15
PORTREVISION=	6
PORTEPOCH=	2
CATEGORIES=	devel
MASTER_SITES=	https://www.libsdl.org/release/
DISTNAME=	SDL-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform multimedia development API
WWW=		https://www.libsdl.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	nasm:devel/nasm

USES=		cpe gmake iconv libtool localbase:ldflags pathfix pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_header_libusbhid_h=no

CPE_VENDOR=	libsdl
CPE_PRODUCT=	simple_directmedia_layer

CONFIGURE_ARGS+=--disable-alsa --disable-alsatest \
		--disable-arts --disable-video-directfb --disable-video-ggi
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1

EXAMPLES=	test/*.c test/*.bmp test/*.dat test/*.xbm test/*.wav
DOCS=		BUGS CREDITS README README-SDL.txt WhatsNew docs.html

OPTIONS_DEFINE=		AALIB DOCS EXAMPLES LINJOY OPENGL SVGALIB X11
OPTIONS_DEFAULT=	AALIB OPENGL OSS X11
OPTIONS_GROUP=		AUDIO
OPTIONS_GROUP_AUDIO=	NAS OSS PULSEAUDIO SNDIO

AUDIO_DESC=		Audio backend
LINJOY_DESC=		Use Linux joystick driver (via webcamd)

.if exists(/usr/lib/libvgl.so)
OPTIONS_DEFINE+=	VGL
VGL_DESC=		Video Graphics Lib support
OPTIONS_DEFAULT+=	VGL
.endif

AALIB_CONFIGURE_ENABLE=		video-aalib
AALIB_LIB_DEPENDS=		libaa.so:graphics/aalib
NAS_CONFIGURE_ENABLE=		nas
NAS_LIB_DEPENDS=		libaudio.so:audio/nas
LINJOY_VARS=			PKGMESSAGE+=pkg-message.linjoy
LINJOY_BUILD_DEPENDS=		${LOCALBASE}/include/linux/joystick.h:devel/evdev-proto
OPENGL_CONFIGURE_ENABLE=	video-opengl
OPENGL_USES=			gl
OPENGL_USE=			GL=glu
OSS_CONFIGURE_ENABLE=		oss
PULSEAUDIO_CONFIGURE_ENABLE=	pulseaudio
PULSEAUDIO_LIB_DEPENDS=		libpulse-simple.so:audio/pulseaudio
SNDIO_CONFIGURE_ENABLE=		sndio
SNDIO_LIB_DEPENDS=		libsndio.so:audio/sndio
SVGALIB_CONFIGURE_ENABLE=	video-svga
SVGALIB_LIB_DEPENDS=		libvga.so:graphics/svgalib
VGL_CONFIGURE_ENABLE=		video-vgl
VGL_VARS=			PKGMESSAGE+=pkg-message.vgl
X11_CONFIGURE_ENABLE=		video-x11
X11_USES=			xorg
X11_USE=			XORG=x11,xrender,xrandr,xorgproto

post-patch:
	@${REINPLACE_CMD} -e '/EXTRA_LDFLAGS/s/-liconv/${ICONV_LIB}/' \
		${WRKSRC}/configure

post-patch-LINJOY-on:
	@${CP} -f ${WRKSRC}/src/joystick/linux/SDL_sysjoystick.c \
	    ${WRKSRC}/src/joystick/bsd/
	@${REINPLACE_CMD} -e 's|#ifdef SDL_JOYSTICK_LINUX|#if 1|g ; \
	    s|SDL_INPUT_LINUXEV|1|g' \
		${WRKSRC}/src/joystick/bsd/SDL_sysjoystick.c

post-patch-SNDIO-on:
	@${MKDIR} ${WRKSRC}/src/audio/sndio
	@${CP} ${FILESDIR}/SDL_sndioaudio.* ${WRKSRC}/src/audio/sndio

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR} &&\
		${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}/ &&\
	cd ${WRKSRC} &&\
		${COPYTREE_SHARE} docs ${STAGEDIR}${DOCSDIR}/ "! -regex .*/man3.*"
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR} &&\
		${INSTALL_DATA} ${EXAMPLES:S,^,${WRKSRC}/,} ${STAGEDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
