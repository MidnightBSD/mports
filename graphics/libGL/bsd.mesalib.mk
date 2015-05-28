# bsd.mesalib.mk - shared code between MesaLib ports.
#
# !!! Here be dragons !!! (they seem to be everywhere these days)
#
# Remember to upgrade the following ports everytime you bump MESAVERSION:
#
#    - graphics/dri
#    - graphics/gbm
#    - graphics/libEGL
#    - graphics/libGL
#    - graphics/libglapi
#    - graphics/libglesv2
#    - graphics/libosmesa
#    - lang/clover
#
# $MidnightBSD$
# $FreeBSD: head/graphics/libGL/bsd.mesalib.mk 380804 2015-03-08 21:42:51Z kwm $

MESAVERSION=	${MESABASEVERSION}${MESASUBVERSION:C/^(.)/.\1/}
MESADISTVERSION=${MESABASEVERSION}${MESASUBVERSION:C/^(.)/-\1/}

.if defined(WITH_NEW_MESA)
MESABASEVERSION=	10.4.6
# if there is a subversion, don't include the '-' between 7.11-rc2.
MESASUBVERSION=

MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/${MESABASEVERSION}/
PLIST_SUB+=	OLD="@comment " NEW=""

# work around libarchive bug?
EXTRACT_CMD=		${LOCALBASE}/bin/gtar
EXTRACT_DEPENDS+=	gtar:${PORTSDIR}/archivers/gtar

.else
MESABASEVERSION=	9.1.7
MESASUBVERSION=		
MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/older-versions/${MESABASEVERSION:R:R}.x/${MESABASEVERSION}/
PLIST_SUB+=	OLD="" NEW="@comment "
.endif

DISTFILES=	MesaLib-${MESADISTVERSION}${EXTRACT_SUFX}
MAINTAINER=	ports@MidnightBSD.org

BUILD_DEPENDS+=	makedepend:${PORTSDIR}/devel/makedepend \
		${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py-libxml2

LIB_DEPENDS+=	libdevq.so:${PORTSDIR}/devel/libdevq

USES+=		bison gettext-tools gmake libtool pathfix pkgconfig \
		python:2,build shebangfix tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CPPFLAGS+=	-isystem${LOCALBASE}/include
LDFLAGS+=	-Wl,-Y${LOCALBASE}/lib

PKGINSTALL=	${.CURDIR}/pkg-install
PKGDEINSTALL=	${.CURDIR}/pkg-deinstall

BUILD_DEPENDS+=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
CONFIGURE_ENV+=	ac_cv_prog_LEX=${LOCALBASE}/bin/flex

python_OLD_CMD=	"/usr/bin/env[[:space:]]python"
python_CMD=	${LOCALBASE}/bin/python2
SHEBANG_FILES=	src/gallium/*/*/*.py src/gallium/tools/trace/*.py \
		src/gallium/drivers/svga/svgadump/svga_dump.py \
		src/glsl/tests/compare_ir src/mapi/glapi/gen/*.py

.if defined(WITH_NEW_MESA)
SHEBANG_FILES+=	src/mapi/mapi_abi.py
.endif

MASTERDIR=		${.CURDIR}/../../graphics/libGL
.if defined(WITH_NEW_MESA)
PATCHDIR=		${MASTERDIR}/files
CONFIGURE_ARGS+=	--disable-dri3
.else
PATCHDIR=		${MASTERDIR}/files-old
.endif
DESCR=			${.CURDIR}/pkg-descr
PLIST=			${.CURDIR}/pkg-plist
WRKSRC=			${WRKDIR}/Mesa-${MESADISTVERSION}
INSTALL_TARGET=		install-strip

COMPONENT=		${PORTNAME:tl:C/^lib//:C/mesa-//}

.if defined(WITH_NEW_MESA)
MESA_LLVM_VER=35
.else
MESA_LLVM_VER=33
.endif

.if ${COMPONENT:Mglesv2} == ""
CONFIGURE_ARGS+=	--disable-gles2
.else
CONFIGURE_ARGS+=	--enable-gles2
.endif

.if ${COMPONENT:Megl} == ""
CONFIGURE_ARGS+=	--disable-egl
.else
CONFIGURE_ARGS+=	--enable-egl
.endif

.if ${COMPONENT:Mclover} == ""
CONFIGURE_ARGS+=	--disable-opencl
.else
CONFIGURE_ARGS+=	--enable-opencl
.endif

.if ${COMPONENT:Mdri} == "" && ${COMPONENT:Mclover} == ""
CONFIGURE_ARGS+=--with-dri-drivers=no
CONFIGURE_ARGS+=--enable-gallium-llvm=no --without-gallium-drivers
.else
# done in the dri port
# need to enable this globaly because it also used in dri ..
# the third possible option is wayland.
CONFIGURE_ARGS+=	--enable-egl --with-egl-platforms=x11,drm
.endif

.if ${COMPONENT:Mvdpau} == ""
CONFIGURE_ARGS+=--disable-vdpau
.else
CONFIGURE_ARGS+=--enable-vdpau
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-ffast-math|${FAST_MATH}|' -e 's|x86_64|amd64|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|/etc/|${PREFIX}/etc/|g' \
		${WRKSRC}/src/mesa/drivers/dri/common/xmlconfig.c
.if !defined(WITH_NEW_MESA)
	@${REINPLACE_CMD} -e 's|#!/usr/bin/python|#!${PYTHON_CMD}|g' \
		${WRKSRC}/src/mesa/drivers/dri/common/xmlpool/gen_xmlpool.py \
		${WRKSRC}/src/glsl/builtins/tools/*.py
.else
	@${REINPLACE_CMD} -e 's|#!/use/bin/python|#!${PYTHON_CMD}|g' \
		${WRKSRC}/src/mesa/drivers/dri/common/xmlpool/gen_xmlpool.py
.endif
	@${REINPLACE_CMD} -e 's|!/use/bin/python2|!${PYTHON_CMD}|g' \
		${WRKSRC}/src/mesa/main/get_hash_generator.py \
		${WRKSRC}/src/mapi/glapi/gen/gl_enums.py \
		${WRKSRC}/src/mapi/glapi/gen/gl_table.py

pre-build: pre-mesa-build

pre-mesa-build:
.if defined(WITH_NEW_MESA)
# do propper gmake target.
	@cd ${WRKSRC}/src/mesa/drivers/dri/common/xmlpool && ${MAKE_CMD}
	@cd ${WRKSRC}/src/loader && ${MAKE_CMD} libloader.la
.endif

