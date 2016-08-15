# $FreeBSD: ports/multimedia/x264/Makefile,v 1.80 2010/11/30 09:50:46 mm Exp $
# $MidnightBSD$

PORTNAME=	x264
PORTVERSION=	0.${X264_BUILD}.${X264_REV}
CATEGORIES=	multimedia
MASTER_SITES=	ftp://ftp.videolan.org/pub/videolan/x264/snapshots/ \
		http://samples.mplayerhq.hu/yuv4mpeg2/:pgo
DISTNAME=	${PORTNAME}-snapshot-${X264_SNAPSHOT}-2245-stable
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	x264
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Front-end for encoding H.264/MPEG-4 AVC video

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	yasm>=1.2.0:${PORTSDIR}/devel/yasm \
		bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	libx264.so:${PORTSDIR}/multimedia/libx264

X264_BUILD=	142
X264_REV=	2455
X264_COMMIT=	021c0dc6c95c1bc239c9db78a80dd85fc856a4dd
X264_GITVER=	${X264_COMMIT:C/^(.......).*$/\1/g}
X264_SNAPSHOT=	20140827

USES=		gmake pkgconfig tar:bzip2
USE_LDCONFIG=	yes
HAS_CONFIGURE=	yes

OPTIONS_DEFINE=		ASM DEBUG GCC GPAC LAVF PGO
OPTIONS_DEFAULT=	ASM GPAC

GCC_DESC=		Use current GCC
GPAC_DESC=		MPEG-4 output support
LAVF_DESC=		libav* format input/output support (requires FFmpeg)

ASM_CONFIGURE_OFF=	--disable-asm
DEBUG_CONFIGURE_ON=	--enable-debug
GPAC_LIB_DEPENDS=	libgpac.so:${PORTSDIR}/multimedia/gpac-libgpac
GPAC_CONFIGURE_OFF=	--disable-gpac
LAVF_LIB_DEPENDS=	libavcodec.so:${PORTSDIR}/multimedia/ffmpeg \
			libavformat.so:${PORTSDIR}/multimedia/ffmpeg \
			libavutil.so:${PORTSDIR}/multimedia/ffmpeg \
			libswscale.so:${PORTSDIR}/multimedia/ffmpeg
LAVF_CONFIGURE_OFF=	--disable-swscale --disable-lavf

CONFIGURE_ARGS+=	--extra-cflags="-I${LOCALBASE}/include" \
			--extra-ldflags="-L${LOCALBASE}/lib" \
			--disable-opencl \
			--system-libx264 \
			--host=${ARCH}-freebsd9.1

CFLAGS_armv6+=		-mcpu=arm1136jf-s

PLIST_FILES=	bin/x264
PLIST_SUB+=	X264_BUILD=${X264_BUILD}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGCC}
USE_GCC=	yes
.elif ${PORT_OPTIONS:MPGO}
USE_GCC=	any
.endif

.if ${PORT_OPTIONS:MPGO}
# y4m sample video
Y4M_VIDEO=		example.y4m
Y4M_VIDEO_DISTFILE=	example.y4m.bz2

DISTFILES+=	${Y4M_VIDEO_DISTFILE}:pgo
ALL_TARGET=	fprofiled
MAKE_ENV+=	VIDS="${WRKDIR}/${Y4M_VIDEO}"

RESTRICTED=		${Y4M_VIDEO_DISTFILE} file may not be mirrored
RESTRICTED_FILES=	${Y4M_VIDEO_DISTFILE}
.endif

post-extract:
.if ${PORT_OPTIONS:MPGO}
	@( cd ${WRKDIR} && ${BZIP2_CMD} -dc ${DISTDIR}/${DIST_SUBDIR}/${Y4M_VIDEO_DISTFILE} > ${Y4M_VIDEO} )
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|; \
		s|/bin/bash|${LOCALBASE}/bin/bash|; \
		s|gpac_static|gpac|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|bash|sh|; \
		s|VER="x"|VER="${X264_REV} ${X264_GITVER}"|; \
		s|VERSION=""|VERSION=" r${X264_REV} ${X264_GITVER}"|' \
		${WRKSRC}/version.sh
	${CP} ${PORTSDIR}/Templates/config.guess ${WRKSRC}/

pre-build:
	@(${RM} ${WRKSRC}/x264_config.h)

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/x264

.include <bsd.port.mk>
