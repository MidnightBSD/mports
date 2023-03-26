PORTNAME=	scummvm
PORTVERSION=	2.2.0
CATEGORIES=	games emulators
MASTER_SITES=	https://downloads.scummvm.org/frs/${PORTNAME}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interpreter for several adventure games
WWW=		https://www.scummvm.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libtheoradec.so:multimedia/libtheora \
		libfaad.so:audio/faad \
		libmpeg2.so:multimedia/libmpeg2 \
		libfreetype.so:print/freetype2 \
		libfribidi.so:converters/fribidi \
		libtheoradec.so:multimedia/libtheora

USE_GCC=	yes
USES=		cpe gl gmake gnome iconv jpeg \
		localbase:ldflags pkgconfig sdl tar:xz
USE_GL=		gl glew
HAS_CONFIGURE=	yes
USE_SDL=	sdl2
INSTALLS_ICONS=	yes

CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-sdl-prefix=${LOCALBASE} \
		--with-jpeg-prefix=${LOCALBASE} \
		--disable-alsa \
		--with-zlib-prefix=/usr \
		--disable-debug \
		--disable-nasm \
		--disable-tremor \
		--enable-verbose-build

LDFLAGS+=	-lpthread

OPTIONS_DEFINE=		A52 CURL DOCS FLAC FLUIDSYNTH MP3 MT32EMU PNG SNDIO VORBIS
OPTIONS_DEFAULT=	A52 MP3 MT32EMU PNG VORBIS
OPTIONS_SUB=		yes

CURL_DESC=	Enable ScummVM cloud storage backend
MT32EMU_DESC=	MT-32 emulator

A52_LIB_DEPENDS=	liba52.so:audio/liba52
A52_CONFIGURE_ON=	--with-a52-prefix=${LOCALBASE}
A52_CONFIGURE_OFF=	--disable-a52

CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
CURL_CONFIGURE_ON=	--with-libcurl-prefix=${LOCALBASE}
CURL_CONFIGURE_OFF=	--disable-libcurl

VORBIS_LIB_DEPENDS=	libogg.so:audio/libogg \
			libvorbis.so:audio/libvorbis
VORBIS_CONFIGURE_ON=	--with-ogg-prefix=${LOCALBASE} \
			--with-vorbis-prefix=${LOCALBASE}
VORBIS_CONFIGURE_OFF=	--disable-vorbis \
			--disable-ogg

MP3_LIB_DEPENDS=	libmad.so:audio/libmad
MP3_CONFIGURE_ON=	--with-mad-prefix=${LOCALBASE}
MP3_CONFIGURE_OFF=	--disable-mad

PNG_LIB_DEPENDS=	libpng.so:graphics/png
PNG_CONFIGURE_ON=	--with-png-prefix=${LOCALBASE}
PNG_CONFIGURE_OFF=	--disable-png

FLAC_LIB_DEPENDS=	libFLAC.so:audio/flac
FLAC_CONFIGURE_ON=	--with-flac-prefix=${LOCALBASE}
FLAC_CONFIGURE_OFF=	--disable-flac

FLUIDSYNTH_LIB_DEPENDS=		libfluidsynth.so:audio/fluidsynth
FLUIDSYNTH_CONFIGURE_ON=	--with-fluidsynth-prefix=${LOCALBASE}
FLUIDSYNTH_CONFIGURE_OFF=	--disable-fluidsynth

MT32EMU_CONFIGURE_OFF=	--disable-mt32emu

SNDIO_LIB_DEPENDS=	libsndio.so:audio/sndio
SNDIO_CONFIGURE_ON=	--with-sndio-prefix=${LOCALBASE}
SNDIO_CONFIGURE_OFF=	--disable-sndio

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e '/^mandir=/s/datarootdir/prefix/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/dists/${PORTNAME}.desktop \
		${STAGEDIR}${DESKTOPDIR}
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.post.mk>
