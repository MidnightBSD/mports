# $MidnightBSD$

PORTNAME=	vorbis-tools
PORTVERSION=	1.4.0
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Play, encode, and manage Ogg Vorbis files

LICENSE=	gpl2

LIB_DEPENDS=	ao.4:${PORTSDIR}/audio/libao \
		curl:${PORTSDIR}/ftp/curl \
		FLAC:${PORTSDIR}/audio/flac \
		kate.4:${PORTSDIR}/multimedia/libkate \
		speex.1:${PORTSDIR}/audio/speex \
		vorbis.4:${PORTSDIR}/audio/libvorbis

USES=		pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=     NLS=""
.else
USES+=		iconv
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=     NLS="@comment "
.endif

post-install:
	${MKDIR} ${PREFIX}/share/examples/vorbis-tools
	${INSTALL_DATA} ${WRKSRC}/ogg123/ogg123rc-example \
		${PREFIX}/share/examples/vorbis-tools/ogg123rc

.include <bsd.port.mk>
