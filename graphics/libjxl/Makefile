PORTNAME=	libjxl
DISTVERSIONPREFIX=	v
DISTVERSION=	0.11.1
PORTREVISION=	1
CATEGORIES=	graphics

PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/
PATCH_SITES+=	FREEBSD_LOCAL/jbeich/${PORTNAME}_patches # backup
PATCHFILES+=	d2411cebb0c3.patch:-p1 # https://github.com/libjxl/libjxl/pull/4007

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JPEG XL reference encoder/decoder
WWW=		https://jpeg.org/jpegxl/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libbrotlienc.so:archivers/brotli \
		libhwy.so:devel/highway
TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake:testing compiler:c++11-lib cpe localbase:ldflags pkgconfig shared-mime-info
CPE_VENDOR=	${PORTNAME}_project
USE_GITHUB=	yes
USE_LDCONFIG=	yes
GH_TUPLE=	libjxl:testdata:ff8d743:testdata/testdata \
		webmproject:sjpeg:e5ab130:sjpeg/third_party/sjpeg \
		${NULL}
CMAKE_ON=	JPEGXL_ENABLE_PLUGINS
CMAKE_ON+=	${AVX512 AVX512_SPR AVX512_ZEN4:L:S/^/JPEGXL_ENABLE_/}
CMAKE_OFF=	${BENCHMARK FUZZERS TCMALLOC:L:S/^/JPEGXL_ENABLE_/}
CMAKE_OFF+=	${OpenGL GLUT:L:S/^/CMAKE_DISABLE_FIND_PACKAGE_/} # sjpeg
CMAKE_OFF+=	${CMAKE_TESTING_ON}
LDFLAGS+=	-Wl,--as-needed # brotlicommon, OPENEXR/PNG deps
PLIST_SUB=	VERSION=${PORTVERSION}

OPTIONS_DEFINE=	GIF JPEG LCMS2 LTO MANPAGES OPENEXR PIXBUF PNG
OPTIONS_DEFAULT=GIF JPEG LTO MANPAGES OPENEXR PIXBUF PNG
OPTIONS_DEFAULT_powerpc=	LCMS2
OPTIONS_DEFAULT_powerpc64=	LCMS2
OPTIONS_EXCLUDE_i386=	LTO # ConvolutionWithTranspose(): JXL_CHECK: out->xsize() == in.ysize()
OPTIONS_EXCLUDE_riscv64=	LTO # bug 262871
OPTIONS_SUB=	yes

GIF_LIB_DEPENDS=	libgif.so:graphics/giflib
GIF_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_GIF

JPEG_USES=		jpeg
JPEG_CMAKE_BOOL=	JPEGXL_ENABLE_JPEGLI
JPEG_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_JPEG
JPEG_CMAKE_BOOL_OFF+=	JPEGXL_ENABLE_JPEGLI_LIBJPEG # XXX WITH_JPEG8, libmap.conf(5)

LCMS2_LIB_DEPENDS=	liblcms2.so:graphics/lcms2
LCMS2_GH_TUPLE_OFF=	jbeich:skcms:42030a7:skcms/third_party/skcms
LCMS2_CMAKE_BOOL_OFF=	JPEGXL_ENABLE_SKCMS
.if make(makesum)
GH_TUPLE+=		${LCMS2_GH_TUPLE_OFF}
.endif

LTO_CMAKE_BOOL=		CMAKE_INTERPROCEDURAL_OPTIMIZATION
LTO_CMAKE_ON=		-DCMAKE_POLICY_DEFAULT_CMP0069:STRING=NEW

MANPAGES_BUILD_DEPENDS=	a2x:textproc/asciidoc
MANPAGES_USES=		python:build
MANPAGES_CMAKE_BOOL=	JPEGXL_ENABLE_MANPAGES

OPENEXR_LIB_DEPENDS=	libOpenEXR.so:graphics/openexr
OPENEXR_CMAKE_BOOL=	JPEGXL_ENABLE_OPENEXR

PIXBUF_USES=		gnome
PIXBUF_USE=		GNOME=gdkpixbuf
PIXBUF_CMAKE_BOOL=	JPEGXL_ENABLE_PLUGIN_GDKPIXBUF

PNG_LIB_DEPENDS=	libpng.so:graphics/png
PNG_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_PNG

# magus
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} 's,/usr,${LOCALBASE},' \
		${WRKSRC}/plugins/gdk-pixbuf/jxl.thumbnailer

.include <bsd.port.mk>
