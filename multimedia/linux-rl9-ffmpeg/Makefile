PORTNAME=	ffmpeg
PORTVERSION=	5.1.6
DISTVERSIONSUFFIX=	-2.el9
PORTREVISION=	2
MASTER_SITES=	RPMFUSION9
PKGNAMESUFFIX=	-libs
CATEGORIES=	multimedia linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FFMpeg library (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://ffmpeg.org/

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	aom cairo fontconfig freetype fribidi gsm gnutls imageformats-libs \
		libdrm libgcrypt libidn2 librsvg2 libssh libtheora \
		libva libvdpau libvorbis libvpx libxml2 ocl-icd \
		opus shaderc spirv-tools vulkan xorglibs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}
SRC_DISTFILES=	${PORTNAME}-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${ARCH} == amd64
USE_LINUX+=	vmaf
.endif

.include <bsd.port.mk>
