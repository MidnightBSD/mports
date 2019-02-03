# $MidnightBSD$
# $FreeBSD: ports/audio/openal/Makefile,v 1.41 2006/09/20 11:20:34 stas Exp $

PORTNAME=	openal
PORTVERSION=	20060211
PORTREVISION=	9
CATEGORIES=	audio
MASTER_SITES=	GENTOO/distfiles
DISTVERSION=	0.0.8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D positional spatialized sound library

LICENSE=	gpl2

CONFLICTS=	openal-soft-[0-9]*

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
CFLAGS+=	-Wno-return-type
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd9.0
CONFIGURE_ARGS=	--enable-capture \
		--disable-arts
USES=		pathfix pkgconfig gmake libtool:keepla
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	ESOUND SDL VORBIS SMPEG ALSA
OPTIONS_DEFINE_i386=	ASM
OPTIONS_DEFAULT_i386=	ASM
SMPEG_DESC=	smpeg support

ESOUND_USE=		GNOME=esound
ESOUND_CONFIGURE_ENABLE=esd
SDL_USE=		SDL=sdl
SDL_CONFIGURE_ENABLE=	sdl
VORBIS_LIB_DEPENDS=	libvorbisfile.so:${PORTSDIR}/audio/libvorbis
VORBIS_CONFIGURE_ENABLE=vorbis
SMPEG_LIB_DEPENDS=	libsmpeg.so:${PORTSDIR}/multimedia/smpeg
SMPEG_CONFIGURE_ENABLE=	mp3
ALSA_LIB_DEPENDS=	libasound.so:${PORTSDIR}/audio/alsa-lib
ALSA_CONFIGURE_ENABLE=	alsa
ASM_BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's/-pthread/${PTHREAD_LIBS}/; \
		s/x86_64\*/amd64\* | \*ia64\*/g; \
		/CPPFLAGS=/ d; s/ \*linux\*)/ \*bsd\*)/' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/#include/ s|SDL/||' \
		${WRKSRC}/src/extensions/al_ext_mp3.c
	@${REINPLACE_CMD} -e 's|"mixaudio16_mmx_prk.h"|"arch/i386/mixaudio16_mmx_prk.h"|' \
		${WRKSRC}/src/mixaudio16.h
	@${REINPLACE_CMD} -e 's|@requirements@||; \
		s|Libs: |&${PTHREAD_LIBS} |;\
		s|Cflags: |&${PTHREAD_CFLAGS} |' \
		${WRKSRC}/admin/pkgconfig/openal.pc.in
.if ! ${PORT_OPTIONS:MASM}
	@${REINPLACE_CMD} -e '/^NASM=/ s|=.*|=no|' ${WRKSRC}/configure
.endif

.include <bsd.port.mk>
