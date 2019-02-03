# $MidnightBSD$

PORTNAME=	pilot-link
PORTVERSION=	0.12.5
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	palm comms
MASTER_SITES=	http://downloads.pilot-link.org/ \
		http://miwibox.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Suite of tools used to connect and sync your Palm handled
LICENSE=	gpl2

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt

USES=		pathfix pkgconfig iconv tar:bzip2
GNU_CONFIGURE=	yes
CFLAGS+=	-I${WRKSRC}/popt -I${LOCALBASE}/include
CONFIGURE_ARGS+=${ICONV_CONFIGURE_BASE}  --with-included-popt --enable-conduits --enable-xsltproc
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	PNG THREADS USB
USB_DESC=	Compile with USB via libusb support (READ MANUAL!)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MTHREADS}
CONFIGURE_ARGS+=	--enable-threads
CFLAGS+=		${PTHREAD_LIBS}
CONFIGURE_ENV+=		PTHREAD_LIBS="${PTHREAD_LIBS}" PTHREAD_CFLAGS="${PTHREAD_CFLAGS}"
.endif

.if ${PORT_OPTIONS:MUSB}
CONFIGURE_ARGS+=--enable-libusb
LDFLAGS+=	-L${PREFIX}/lib -lusb

.if ! ${PORT_OPTIONS:MTHREADS}
IGNORE=		cannot be built: USB support requires THREADS turned on.  Please reconfigure using 'make config'
.else
LDFLAGS+=	${PTHREAD_LIBS}
.endif
.endif

.if ${PORT_OPTIONS:MPNG}
LIB_DEPENDS+=	libpng.so:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=	--with-libpng=${PREFIX}
.else
CONFIGURE_ARGS+=	--disable-png
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|png_voidp_NULL|NULL|g' \
		-e 's|png_error_ptr_NULL|NULL|g' \
		${WRKSRC}/src/pilot-read-notepad.c \
		${WRKSRC}/src/pilot-read-palmpix.c \
		${WRKSRC}/src/pilot-read-screenshot.c \
		${WRKSRC}/src/pilot-read-veo.c
.if ${PORT_OPTIONS:MTHREADS}
	@${REINPLACE_CMD} -e 's|Libs: |Libs: ${PTHREAD_LIBS} |' ${WRKSRC}/pilot-link.pc.in ${WRKSRC}/pilot-link-pp.pc.in
.endif

.include <bsd.port.mk>
