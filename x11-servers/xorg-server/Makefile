PORTNAME=	xorg
PORTVERSION=	21.1.18
PORTREVISION=	0
PORTEPOCH=	1
CATEGORIES=	x11-servers
MASTER_SITES=	XORG/individual/xserver
DISTNAME=	xorg-server-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org X server and related programs
WWW=		https://www.freedesktop.org/Software/xorg

LICENSE=	mit

FLAVORS=	xorg xnest xephyr xvfb
FLAVOR?=	${FLAVORS:[1]}

USES=		compiler:c11 cpe gl meson pkgconfig tar:xz xorg
USE_GL=		gl

NO_TEST=	yes

.if ${FLAVOR} == xephyr
PORTNAME=	xephyr
.elif  ${FLAVOR} == xorg
PKGNAMESUFFIX=	-server
.elif ${FLAVOR} == xnest
PORTEPOCH=	2
PKGNAMESUFFIX= -nestserver
.elif ${FLAVOR} == xvfb
PKGNAMESUFFIX=	-vfbserver
.endif

.if ${FLAVOR} != xorg
PLIST=
PKGMESSAGE=
BINARY_NAME=	${FLAVOR:C/^(.).*/\1/:tu}${FLAVOR:C/^.//}
PLIST_FILES=	bin/${BINARY_NAME} \
		share/man/man1/${BINARY_NAME}.1.gz
PLIST_DIRS=	/var/lib/xkb /var/lib
.endif

DESCR=	${.CURDIR}/pkg-descr-${FLAVOR}

BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri
RUN_DEPENDS+=	xkeyboard-config>=2.5:x11/xkeyboard-config \
		xkbcomp:x11/xkbcomp \
		${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri

MESON_ARGS+=	-Dxwin=false \
		-Dxquartz=false \
		-Ddtrace=false \
		-Dhal=false \
		-Dsystemd_logind=false \
		-Dxselinux=false \
		-Dfallback_input_driver=libinput \
		-Ddocs=false \
		-Dxcsecurity=true \
		-Dxkb_dir=${LOCALBASE}/share/X11/xkb \
		-Dxkb_output_dir=/var/lib/xkb \
		-D${FLAVOR}=true

.for f in ${FLAVORS:N${FLAVOR}}
MESON_ARGS+=	-D${f}=false
.endfor

.if ${FLAVOR} == xorg
LIB_DEPENDS+=		libudev.so:devel/libudev-devd \
			libxcvt.so:x11/libxcvt
MESON_ARGS+=	-Dudev=true \
		-Dudev_kms=true \
		-Dlog_dir=/var/log \
		-Dsuid_wrapper=true
.else
MESON_ARGS+=	-Dudev=false \
		-Dudev_kms=false
.endif

.if ${FLAVOR} == xorg || ${FLAVOR} == xephyr
MESON_ARGS+=	-Ddrm=true
LIB_DEPENDS+=	libdrm.so:graphics/libdrm \
		libepoxy.so:graphics/libepoxy
.endif

.if ${FLAVOR} == xephyr
LIB_DEPENDS+=	libxcb-render-util.so:x11/xcb-util-renderutil \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-keysyms.so:x11/xcb-util-keysyms
.endif

FONTPATH_ROOT?=	${LOCALBASE}/share/fonts
FONTPATHD?=	${PREFIX}/etc/X11/fontpath.d
DEFAULT_FONTPATH_LIST= \
	${FONTPATH_ROOT}/misc/	\
	${FONTPATH_ROOT}/TTF/ \
	${FONTPATH_ROOT}/OTF/ \
	${FONTPATH_ROOT}/Type1/ \
	${FONTPATH_ROOT}/100dpi/ \
	${FONTPATH_ROOT}/75dpi/ \
	catalogue:${FONTPATHD}
MESON_ARGS+=	-Ddefault_font_path=${DEFAULT_FONTPATH_LIST:ts,}
PLIST_SUB+=	FONTPATHD="${FONTPATHD:S,^${PREFIX}/,,}"

USE_GL+=	gl
USE_XORG+=	pixman xau xdmcp xfont2 xkbfile xorgproto xshmfence xtrans
CPE_VENDOR=	x.org
CPE_PRODUCT=	xorg-server

.if ${FLAVOR} == xorg
USE_GL+=	gbm
USE_XORG+=	pciaccess
.endif

.include <bsd.port.pre.mk>

MESON_ARGS+=	-Dsha1=libmd

.if ${ARCH} == aarch64 || ${ARCH} == amd64 || ${ARCH} == armv7 || ${ARCH} == i386
LIB_DEPENDS+=	libunwind.so:devel/libunwind
.endif

.if ${FLAVOR} == xorg
post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11/xorg.conf.d
	@${MKDIR} ${STAGEDIR}${FONTPATHD}
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/X11/xorg.conf.d
	@${INSTALL_DATA} ${FILESDIR}/20-evdev-kbd.conf \
		${STAGEDIR}${PREFIX}/share/X11/xorg.conf.d
	${MKDIR} -p ${STAGEDIR}/var/lib/xkb
.else
post-install:
	${RM} -r ${STAGEDIR}${PREFIX}/lib/xorg/protocol.txt
	${RMDIR} ${STAGEDIR}${PREFIX}/lib/xorg
	${RM} ${STAGEDIR}${PREFIX}/share/man/man1/Xserver.1
	${MKDIR} -p ${STAGEDIR}/var/lib/xkb
.endif

.include <bsd.port.post.mk>
