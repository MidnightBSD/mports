# $MidnightBSD$
# $FreeBSD: ports/graphics/libggi/Makefile,v 1.28 2007/05/19 20:09:47 flz Exp $

PORTNAME=	libggi
PORTVERSION=	2.2.2
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	graphics devel
MASTER_SITES=	SF/ggi/ggi-core/${PORTNAME}-${PORTVERSION}		

DISTNAME=	${PORTNAME}-${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible drawing library

LICENSE=	mit

LIB_DEPENDS=	libgii.so:${PORTSDIR}/devel/libgii

USES=		libtool:keepla tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CPPFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}

CONFIGURE_ARGS=	--disable-directfb

.if exists(/usr/include/dev/kgi/kgi.h)
CONFIGURE_ARGS+=	--enable-kgi --with-extra-includes=/usr/include/dev
.endif

.if !defined(WITHOUT_X11)
USE_XORG=	x11 xxf86dga xxf86vm ice sm xau xext
PLIST_SUB+=	WITH_X=""
.else
CONFIGURE_ARGS+=	--disable-x --disable-dga
PLIST_SUB+=	WITH_X="@comment "
.endif

.include <bsd.port.pre.mk>

.if !exists(/usr/include/vgl.h) || ${ARCH} != "i386"
CONFIGURE_ARGS+=	--disable-vgl
PLIST_SUB+=	WITH_VGL="@comment "
.else
PLIST_SUB+=	WITH_VGL=""
.endif

.if defined(WITH_AALIB) || exists(${LOCALBASE}/include/aalib.h)
LIB_DEPENDS+=	aa.1:${PORTSDIR}/graphics/aalib
PLIST_SUB+=	WITH_AALIB=""
.else
PLIST_SUB+=	WITH_AALIB="@comment "
.endif

.if defined(WITH_SVGALIB) || exists(${LOCALBASE}/include/vga.h)
LIB_DEPENDS+=	vga.1:${PORTSDIR}/graphics/svgalib
PLIST_SUB+=	WITH_SVGALIB=""
.else
PLIST_SUB+=	WITH_SVGALIB="@comment "
.endif

post-install:
	${TOUCH} ${PREFIX}/lib/ggi/default/fbdev/.keep
	${TOUCH} ${PREFIX}/lib/ggi/default/kgi/.keep
	${TOUCH} ${PREFIX}/lib/ggi/helper/.keep
	${INSTALL_DATA} ${WRKSRC}/libggi.conf ${PREFIX}/etc/ggi/libggi.conf.dist

.include <bsd.port.post.mk>
