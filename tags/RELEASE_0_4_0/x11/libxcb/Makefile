# $MidnightBSD: mports/x11/libxcb/Makefile,v 1.9 2013/02/23 15:25:42 laffer1 Exp $

PORTNAME=	libxcb
PORTVERSION=	1.9.1
CATEGORIES=	x11 python
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) library
LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/lib/libcheck.a:${PORTSDIR}/devel/libcheck \
		xcb-proto>=1.7:${PORTSDIR}/x11/xcb-proto \
		${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs

CONFIGURE_ARGS+=	--disable-build-docs --without-doxygen --enable-xinput

USE_BZIP2=	yes
USE_PATHFIX=	yes
USE_GNOME=	libxslt:build
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xau xdmcp
USE_PYTHON_BUILD=	2.5+

GNU_CONFIGURE=	yes
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

.include "${.CURDIR}/manpages"

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${MAKE} ${FAKE_MAKEARGS} -C ${WRKSRC}/doc ${INSTALL_TARGET}
.endif

.include <bsd.port.mk>
