PORTNAME=	libdlna
PORTVERSION=	0.2.3
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://libdlna.geexbox.org/releases/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference DLNA open-source implementation

LICENSE=	lgpl

LIB_DEPENDS+=	libavcodec.so:multimedia/ffmpeg

HAS_CONFIGURE=	yes
USES=		tar:bzip2 gmake pathfix pkgconfig
PATHFIX_MAKEFILEIN=	Makefile
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

CONFIGURE_ARGS+=	--prefix="${PREFIX}" --disable-optimize \
			--includedir=${LOCALBASE}/include \
			--libdir=${LOCALBASE}/lib

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-extract:
	${REINPLACE_CMD} -e 's|CODEC_ID|AV_CODEC_ID|g' \
		${WRKSRC}/src/*.c

post-install:
	-${MV} ${PREFIX}/lib/pkgconfig/libdlna.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
