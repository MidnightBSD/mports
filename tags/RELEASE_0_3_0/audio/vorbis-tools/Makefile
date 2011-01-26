# $MidnightBSD: mports/audio/vorbis-tools/Makefile,v 1.4 2010/08/14 06:18:10 laffer1 Exp $

PORTNAME=	vorbis-tools
PORTVERSION=	1.4.0
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Play, encode, and manage Ogg Vorbis files
LICENSE=	gpl2

LIB_DEPENDS=	ao.4:${PORTSDIR}/audio/libao \
		curl.6:${PORTSDIR}/ftp/curl \
		FLAC.10:${PORTSDIR}/audio/flac \
		kate.3:${PORTSDIR}/multimedia/libkate \
		speex.1:${PORTSDIR}/audio/speex \
		vorbis.4:${PORTSDIR}/audio/libvorbis

GNU_CONFIGURE=	yes
CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd7.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
MAKE_JOBS_SAFE=	yes

.if !defined(WITHOUT_NLS)
USE_GETTEXT=    yes
PLIST_SUB+=     NLS=""
.else
USE_ICONV=	yes
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=     NLS="@comment "
.endif

MAN1=		ogg123.1 oggdec.1 oggenc.1 ogginfo.1 vcut.1 vorbiscomment.1

post-install:
	${MKDIR} ${PREFIX}/share/examples/vorbis-tools
	${INSTALL_DATA} ${WRKSRC}/ogg123/ogg123rc-example \
		${PREFIX}/share/examples/vorbis-tools/ogg123rc

.include <bsd.port.mk>
