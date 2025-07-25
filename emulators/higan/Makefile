PORTNAME=	higan
DISTVERSIONPREFIX=	v
DISTVERSION=	110
PORTREVISION=	1
CATEGORIES=	emulators games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nintendo multi-system emulator
WWW=		https://github.com/higan-emu/higan

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

ONLY_FOR_ARCHS=	amd64 i386 powerpc powerpc64 powerpc64le

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz

USES=		compiler:c++14-lang gettext gmake gnome pkgconfig xorg
USE_GNOME=	cairo gdkpixbuf gtk20 gtksourceview2
USE_XORG=	x11 xext xrandr
USE_CSTD=	c99
USE_CXXSTD=	c++14

USE_GITHUB=	yes
GH_ACCOUNT=	higan-emu

MAKEFILE=	GNUmakefile
MAKE_ENV=	compiler="${CXX}" hiro="gtk2"

OPTIONS_DEFINE=		DEBUG
OPTIONS_MULTI=		VIDEO SOUND INPUT
OPTIONS_MULTI_VIDEO=	GLX SDL XSHM XV
OPTIONS_MULTI_SOUND=	AO OPENAL OSS PULSEAUDIO
OPTIONS_MULTI_INPUT=	INPUT_SDL INPUT_X
OPTIONS_DEFAULT=	GLX XSHM XV SDL \
			OPENAL INPUT_SDL INPUT_X

XSHM_DESC=		Build XShm video driver
XV_DESC=		Build Xv video driver
INPUT_SDL_DESC=		Build SDL input driver
INPUT_X_DESC=		Build X input driver

GLX_USES=	gl
GLX_USE=	GL=gl
GLX_VARS=	VIDEO_DRIVER+=video.glx

SDL_USES=	sdl
SDL_USE=	XORG=xv SDL=sdl2
SDL_VARS=	VIDEO_DRIVER+=video.sdl

XSHM_USE=	XORG=xext
XSHM_VARS=	VIDEO_DRIVER+=video.xshm

XV_USE=		XORG=xv
XV_VARS=	VIDEO_DRIVER+=video.xvideo

AO_LIB_DEPENDS=	libao.so:audio/libao
AO_VARS=	AUDIO_DRIVER+=audio.ao

OPENAL_USES=	openal:al
OPENAL_VARS=	AUDIO_DRIVER+=audio.openal

OSS_VARS=	AUDIO_DRIVER+=audio.oss

PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio
PULSEAUDIO_VARS=	AUDIO_DRIVER+=audio.pulseaudio

INPUT_SDL_USES=	sdl
INPUT_SDL_USE=	SDL=sdl
INPUT_SDL_VARS=	INPUT_DRIVER+=input.sdl

INPUT_X_VARS=	INPUT_DRIVER+=input.xlib

post-patch:
	${REINPLACE_CMD} -e 's|/usr/share/|${PREFIX}/share/|' \
		${WRKSRC}/nall/path.hpp

post-patch-DEBUG-on:
	${REINPLACE_CMD} -e 's|-O3|-g|g' \
		${WRKSRC}/higan/GNUmakefile \
		${WRKSRC}/icarus/GNUmakefile

do-build:
.for d in higan icarus
	@${DO_MAKE_BUILD} ${ALL_TARGET} -C${WRKSRC}/${d}
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/higan/out/higan ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/icarus/out/icarus ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/higan/target-higan/resource/higan.png ${STAGEDIR}${PREFIX}/share/pixmaps/
	${INSTALL_DATA} ${WRKSRC}/higan/target-higan/resource/higan.desktop ${STAGEDIR}${PREFIX}/share/applications/
	(cd ${WRKSRC}/higan/System && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/)
	(cd ${WRKSRC}/icarus/Database && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/share/icarus/Database/)

.include <bsd.port.mk>
