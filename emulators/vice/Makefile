PORTNAME=	vice
PORTVERSION=	3.10
CATEGORIES=	emulators
MASTER_SITES=	SF/vice-emu/releases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emulator for Commodore C64, C128, VIC20, PET, and CBM-II
WWW=		https://vice-emu.sourceforge.io/

LICENSE=	gpl2 ROM
LICENSE_COMB=	multi
LICENSE_NAME_ROM=	Commodore ROMs
LICENSE_TEXT_ROM=	ROMs are copyrighted by Commodore Business Machines
LICENSE_PERMS_ROM=	auto-accept

BUILD_DEPENDS=	xa65:devel/xa65 \
		xdg-open:devel/xdg-utils
LIB_DEPENDS=	libpng.so:graphics/png \
		libgif.so:graphics/giflib \
		libportaudio.so:audio/portaudio \
		libmp3lame.so:audio/lame \
		libogg.so:audio/libogg \
		libvorbis.so:audio/libvorbis \
		libavcodec.so:multimedia/ffmpeg \
		libFLAC.so:audio/flac \
		libpci.so:devel/libpci \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libpcre2-8.so:devel/pcre2 \
		libgnutls.so:security/gnutls \
		libharfbuzz.so:print/harfbuzz

USES=		compiler:c++11-lang pkgconfig perl5 localbase:ldflags \
		gmake iconv:wchar_t jpeg readline gettext sdl xorg
USE_XORG=	xpm ice sm xext xv xt x11 xmu xxf86vm
USE_XORG+=	xrender xinerama xi xrandr xcursor xcomposite xdamage xfixes
USE_SDL=	sdl
HAS_CONFIGURE=	yes
MAKE_ENV+=	 XDG_DATA_DIRS=${FAKE_DESTDIR}${PREFIX}/share
CFLAGS+=	-fcommon
CONFIGURE_ARGS+=	--enable-ipv6 \
			--enable-external-ffmpeg \
			--enable-x64 \
			--disable-realdevice \
			--disable-pdf-docs \
			--localedir="${LOCALBASE}/share/locale" \
			--disable-dependency-tracking \
			--without-libcurl \
			--host=${ARCH}-portbld-freebsd11.4 \
			--build=${ARCH}-portbld-freebsd11.4 \
			DOS2UNIX=true
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

OPTIONS_DEFINE=	SDLSOUND ALSA PULSEAUDIO DOCS
OPTIONS_SINGLE=	GUI
OPTIONS_SINGLE_GUI=	GTK3UI SDLUI2
OPTIONS_DEFAULT?=	GTK3UI SDLSOUND ALSA
NO_OPTIONS_SORT=yes
OPTIONS_SUB=	yes
GTK3UI_DESC=	use GTK3 user interface
SDLUI2_DESC=	use SDL2 user interface
SDLSOUND_DESC=	build with SDL2 sound system support

PORTDOCS=	CIA-README.txt \
		Documentation-Howto.txt \
		Doxygen-Howto.txt \
		FreeBSD-GTK3-Howto.txt \
		GTK3-Fedora-cross-build-setup.md \
		Linux-GTK3-Howto.txt \
		NetBSD-GTK3-Howto.txt \
		NetBSD-howto.txt \
		OpenBSD-GTK3-Howto.txt \
		Readme-SDL.txt \
		Readme-SDL2.txt \
		Release-Howto.txt \
		SDL-Howto.txt \
		Windows-MinGW-GTK3-Howto.txt \
		coding-guidelines.txt \
		iec-bus.txt \
		macOS-Distribution-Howto.txt \
		macOS-Howto.txt \
		macOS-Xcode-Howto.txt \
		vice.texi

GTK3UI_USES=			desktop-file-utils
GTK3UI_CONFIGURE_ENABLE=	gtk3ui desktop-files
GTK3UI_BUILD_DEPENDS=		bash:shells/bash
SDLUI2_USES=			sdl
SDLUI2_USE=			SDL=sdl2 SDL=image2
SDLUI2_CONFIGURE_ENABLE=	sdl2ui
SDLSOUND_USES=			sdl
SDLSOUND_USE=			SDL=sdl2
SDLSOUND_CONFIGURE_ON=		--with-sdlsound
ALSA_CONFIGURE_OFF=		--without-alsa
ALSA_LIB_DEPENDS=		libasound.so:audio/alsa-lib
PULSEAUDIO_CONFIGURE_OFF=	--without-pulse
PULSEAUDIO_LIB_DEPENDS=		libpulse.so:audio/pulseaudio

.include <bsd.mport.options.mk>

.if !defined(BUILDING_INDEX)
__pmlinks1!=	${ECHO_CMD} '${LMLINKS:S/    / /}' | ${AWK} \
	'{ if (NF % 2 != 0) { print "broken"; exit; } \
	for (i=1; i<=NF; i++) { \
		if ( i % 2 == 0) { print " " $$i " ;"; } \
		else { printf "${LN} -s " $$i " "; } \
	} }'
.endif

.if ${PORT_OPTIONS:MGTK3UI}
USES+=		gnome gl
USE_GNOME+=	gtk30 vte3 cairo gdkpixbuf pango
USE_GL+=	glu gl glew
.endif

pre-configure:
.if ! ${PORT_OPTIONS:MDOCS}
	${REINPLACE_CMD} -e 's| doc||' ${WRKSRC}/Makefile.in
.endif

# workaround for xdg-desktop-menu and xdg-icon-resource
pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/desktop-directories \
		${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor

post-install:
	@${RM} ${PREFIX}/share/applications/mimeinfo.cache
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/CIA-README.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/Documentation-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/Doxygen-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/Release-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/coding-guidelines.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/iec-bus.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/vice.texi ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/FreeBSD-GTK3-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/GTK3-Fedora-cross-build-setup.md ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/Linux-GTK3-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/NetBSD-GTK3-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/NetBSD-howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/OpenBSD-GTK3-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/SDL-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/Windows-MinGW-GTK3-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/macOS-Distribution-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/macOS-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/building/macOS-Xcode-Howto.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/readmes/Readme-SDL.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/readmes/Readme-SDL2.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
