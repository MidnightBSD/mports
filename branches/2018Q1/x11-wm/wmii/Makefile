# $MidnightBSD$

PORTNAME=	wmii
DISTVERSION=	3.6
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	http://dl.suckless.org/wmii/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic, minimalist window manager for X11

LICENSE=	mit

LIB_DEPENDS=	ixp:${PORTSDIR}/devel/libixp
RUN_DEPENDS=	dmenu:${PORTSDIR}/x11/dmenu

USE_XORG=	x11 xextproto xt xext

MAKE_ARGS=	PREFIX="${PREFIX}" INCLUDE="${LOCALBASE}/include" \
		INCX11="-I${LOCALBASE}/include" LIBX11="-L${LOCALBASE}/lib" \
		CC="${CC} -c" LD="${CC}" LIBIXP="-lixp" STATIC="" \
		MAN="${FAKE_DESTDIR}${MANPREFIX}/man"

MAN1=		wmii.1 wmiiloop.1 wmiir.1

FAKE_MAKEARGS+=	${MAKE_ARGS} PREFIX="${FAKE_DESTDIR}${PREFIX}"

OPTIONS_DEFINE=	SLIM_LAYOUT_BOX UTF8

SLIM_LAYOUT_BOX_DESC=	Build with slim layout boxes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MUTF8}
USES+=		iconv
MAKE_ARGS+=	LIBICONV="-liconv"
.else
MAKE_ARGS+=	-DNO_UTF8
.endif

.if ${PORT_OPTIONS:MSLIM_LAYOUT_BOX}
EXTRA_PATCHES=	${FILESDIR}/extra-patch-slim-layout-boxes
.endif

post-patch: .SILENT
	${REINPLACE_CMD} -e 's|-lfmt -lutf|$${LIBX11} & -lX11|' \
		${WRKSRC}/cmd/Makefile
	${REINPLACE_CMD} -e '/_XOPEN_SOURCE/d' ${WRKSRC}/cmd/wmii/dat.h
# Strip debug build options
	${REINPLACE_CMD} -E 's| -g( -O0)?||' ${WRKSRC}/config.mk
	${REINPLACE_CMD} -e 's|CFLAGS += -DIXPlint|& -DIXP_NEEDAPI=89|' \
		${WRKSRC}/config.mk
# Make actual compile/link commands appear in the build log
	${REINPLACE_CMD} -e 's|^COMPILE=|& noisycc=yes| ; \
		s|^LINK=|& noisycc=yes|' ${WRKSRC}/mk/hdr.mk
# Fix brain-damaged piece of code which breaks on arches where `size_t'
# is not 32-bit unsigned integer (e.g. amd64, sparc64)
	${REINPLACE_CMD} -e '/wmii_strlcat/d' ${WRKSRC}/include/util.h
	${REINPLACE_CMD} -e 's|strlcat|wmii_&|' ${WRKSRC}/include/util.h \
		${WRKSRC}/cmd/util.c ${WRKSRC}/cmd/wmii/client.c

.include <bsd.port.mk>
