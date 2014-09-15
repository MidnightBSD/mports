# $MidnightBSD$

PORTNAME=	libgii
PORTVERSION=	1.0.2
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://www.ggi-project.org/ftp/ggi/v2.2/ \
		SF/ggi/ggi-core/${PORTNAME}-${PORTVERSION}		

DISTNAME=	${PORTNAME}-${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GGI API for input sources

LICENSE=	mit

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USES=		tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.if exists(/usr/include/dev/kii/kii.h)
CONFIGURE_ARGS+=	--enable-kii --with-extra-includes=/usr/include/dev
PLIST_SUB+=	KII=""
.else
PLIST_SUB+=	KII="@comment "
.endif

.if !defined(WITHOUT_X11)
USE_XORG=	x11
PLIST_SUB+=	WITH_X=""
.else
CONFIGURE_ARGS+=	--disable-x --without-x
PLIST_SUB+=	WITH_X="@comment "
.endif

.include <bsd.port.pre.mk>

.if !exists(/usr/include/vgl.h) || ${ARCH} != "i386"
CONFIGURE_ARGS+=	--disable-vgl
PLIST_SUB+=	VGL="@comment "
.else
PLIST_SUB+=	VGL=""
.endif

pre-configure:
	${REINPLACE_CMD} -e 's/-lpthread/${PTHREAD_LIBS}/' ${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/libgii.conf ${PREFIX}/etc/ggi/libgii.conf.dist
	${INSTALL_DATA} ${WRKSRC}/filter/mouse/mouse ${PREFIX}/etc/ggi/filter/mouse.dist
	${INSTALL_DATA} ${WRKSRC}/filter/keytrans/keytrans ${PREFIX}/etc/ggi/filter/keytrans.dist

.include <bsd.port.post.mk>
