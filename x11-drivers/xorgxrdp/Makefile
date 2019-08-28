# $MidnightBSD$
# $FreeBSD: head/x11-drivers/xorgxrdp/Makefile 465777 2018-03-28 03:38:52Z meta $

PORTNAME=	xorgxrdp
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.9
PORTREVISION=	1
CATEGORIES=	x11-drivers
DIST_SUBDIR=	xrdp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org driver enabling use through an RDP session with xrdp

LICENSE=	mit

RUN_DEPENDS=	xauth:x11/xauth
BUILD_DEPENDS=	nasm:devel/nasm

USES=		autoreconf libtool:build pkgconfig
USE_XORG=	xorgproto xorg-server
USE_LDCONFIG=	yes
USE_GITHUB=	yes

GH_ACCOUNT=	neutrinolabs
GH_PROJECT=	xrdp:xrdp
GH_TAGNAME=	v0.9.9:xrdp
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

CFLAGS+=	-I${LOCALBASE}/include
LIBS=		-I${LOCALBASE}/lib
CONFIGURE_ENV=	XRDP_CFLAGS=-I${WRKSRC_xrdp}/common

OPTIONS_DEFINE=	DEBUG

post-patch-DEBUG-on:
	${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e 's|#define LOG_LEVEL [0-9]*|#define LOG_LEVEL 20|'

pre-configure:
	@cd ${WRKSRC} && ./bootstrap

.include <bsd.port.mk>
