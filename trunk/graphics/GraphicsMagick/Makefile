# $MidnightBSD$

PORTNAME=	GraphicsMagick
PORTVERSION=	1.3.20
PORTEPOCH=	1
CATEGORIES=	graphics
MASTER_SITES=	SF \
		ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast image processing tools based on ImageMagick

LICENSE=	mit

LIB_DEPENDS=	libjbig.so:${PORTSDIR}/graphics/jbigkit		\
		libjasper.so:${PORTSDIR}/graphics/jasper	\
		liblcms2.so:${PORTSDIR}/graphics/lcms2		\
		libpng.so:${PORTSDIR}/graphics/png		\
		libtiff.so:${PORTSDIR}/graphics/tiff		\
		libfreetype.so:${PORTSDIR}/print/freetype2

USES=		iconv jpeg libtool tar:bzip2
USE_GHOSTSCRIPT=	yes
USE_GNOME=	libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PTHREAD_LIBS="-lpthread"
CONFIGURE_ARGS=	--without-perl --enable-shared --enable-static \
		--with-quantum-depth="${QD}" \
		--with-windows-font-dir="${WINDOWS_FONT_DIR}"
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PLIST_SUB=	Q="${QD}"

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=		DOCS DPS FPX OPENMP Q8BIT SSE TESTS WEBP X11
OPTIONS_DEFAULT=	OPENMP WEBP X11

DPS_DESC=		Display Ghostscript support (must also select X11)
FPX_LIB_DEPENDS+=	libfpx.so.[2-9]:${PORTSDIR}/graphics/libfpx
FPX_CONFIGURE_WITH=	fpx
OPENMP_USES=		compiler:openmp
OPENMP_CONFIGURE_ON=	--with-threads --enable-openmp --disable-openmp-slow
OPENMP_CONFIGURE_OFF=	--without-threads --disable-openmp
Q8BIT_DESC=		Use 8-bit pixels (speed) instead of 16 (quality)
WEBP_LIB_DEPENDS=	libwebp.so:${PORTSDIR}/graphics/webp
WEBP_CONFIGURE_WITH=	webp
X11_LIB_DEPENDS=	libwmflite.so:${PORTSDIR}/graphics/${LIBWMF_PORT}
X11_USE=		XORG=xext
X11_CONFIGURE_WITH=	x

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MX11} && ${PORT_OPTIONS:MDPS}
LIB_DEPENDS+=	libdps.so:${PORTSDIR}/x11/dgs
USE_XORG=	xt
CONFIGURE_ARGS+=--with-dps
.else
CONFIGURE_ARGS+=--without-dps
.endif

.if ${PORT_OPTIONS:MQ8BIT}
QD=		8
.else
QD=		16
.endif

.if ${PORT_OPTIONS:MSSE}
.if ${MACHINE_CPU:Msse}
CFLAGS+=	-msse
.endif
.if ${MACHINE_CPU:Msse2}
CFLAGS+=	-msse2
.endif
.if ${MACHINE_CPU:Msse3}
CFLAGS+=	-msse3
.endif
.endif

.if ${PORT_OPTIONS:MX11}
LIBWMF_PORT=	libwmf
.else
LIBWMF_PORT=	libwmf-nox11
.endif

.include <bsd.port.pre.mk>

.if !defined(WINDOWS_FONT_DIR)
# Use fonts installed by x11-fonts/webfonts by default
WINDOWS_FONT_DIR=${LOCALBASE}/share/fonts/webfonts
.endif

post-install:
.for i in coders filters
	@${MKDIR} ${PREFIX}/lib/GraphicsMagick/modules-Q${QD}/${i}
.endfor

regression-test: do-build
	(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.post.mk>
# The OPENMP option may select gcc as compiler but on architectures
# that have switched to libc++ clang should be used for C++ code.
CXX=		c++
