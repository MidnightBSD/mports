# $MidnightBSD: mports/x11/libxcb/Makefile,v 1.6 2010/01/02 00:38:15 laffer1 Exp $

PORTNAME=	libxcb
PORTVERSION=	1.7
CATEGORIES=	x11 python
#MASTER_SITES=	XORG/current/src/extras
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) library
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/lib/libcheck.a:${PORTSDIR}/devel/libcheck \
		xsltproc:${PORTSDIR}/textproc/libxslt \
		${LOCALBASE}/libdata/pkgconfig/xcb-proto.pc:${PORTSDIR}/x11/xcb-proto \
		${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-proto.pc:${PORTSDIR}/x11/xcb-proto \
		${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs

CONFIGURE_ARGS+=	--disable-build-docs --without-doxygen --enable-xinput

USE_BZIP2=	yes
USE_GNOME=	gnomehack
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xau xdmcp
USE_PYTHON_BUILD=	2.5-2.7

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS+=	--with-check=${LOCALBASE}
.for f in XPROTO_CFLAGS XPROTO_LIBS XDMCP_CFLAGS XDMCP_LIBS NEEDED_CFLAGS NEEDED_LIBS
CONFIGURE_ARGS+=${f}="${${f}}"
.endfor
CONFIGURE_ENV=	LIBS="`pkg-config --libs pthread-stubs`"

NEEDED_CFLAGS=	-I${LOCALBASE}/include
NEEDED_LIBS=	-L${LOCALBASE}/lib -lXau ${PTHREAD_STUBS_LIBS}

XDMCP_CFLAGS=	-I${LOCALBASE}/include
XDMCP_LIBS=	-L${LOCALBASE}/lib -lXdmcp

XPROTO_CFLAGS=	-I${LOCALBASE}/include
XPROTO_LIBS=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MAKE} -C ${WRKSRC}/doc ${INSTALL_TARGET}
.endif

.include <bsd.port.post.mk>
