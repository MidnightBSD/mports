# $MidnightBSD: mports/audio/vorbis-tools/Makefile,v 1.3 2010/02/27 15:44:45 laffer1 Exp $

PORTNAME=	vorbis-tools
PORTVERSION=	1.2.0
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Play, encode, and manage Ogg Vorbis files
LICENSE=	gpl2

LIB_DEPENDS=	ao.3:${PORTSDIR}/audio/libao \
		curl.6:${PORTSDIR}/ftp/curl \
		FLAC.10:${PORTSDIR}/audio/flac \
		speex.1:${PORTSDIR}/audio/speex \
		vorbis.4:${PORTSDIR}/audio/libvorbis

USE_GETTEXT=	yes

GNU_CONFIGURE=	yes
CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-vcut
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
MAKE_JOBS_SAFE=	yes

MAN1=		ogg123.1 oggdec.1 oggenc.1 ogginfo.1 vcut.1 vorbiscomment.1

post-install:
	${MKDIR} ${PREFIX}/share/examples/vorbis-tools
	${INSTALL_DATA} ${WRKSRC}/ogg123/ogg123rc-example \
		${PREFIX}/share/examples/vorbis-tools/ogg123rc

.include <bsd.port.mk>
