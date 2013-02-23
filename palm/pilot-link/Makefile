# $MidnightBSD: mports/palm/pilot-link/Makefile,v 1.4 2012/09/09 03:52:51 laffer1 Exp $

PORTNAME=	pilot-link
PORTVERSION=	0.12.5
PORTEPOCH=	1
CATEGORIES=	palm comms
MASTER_SITES=	http://downloads.pilot-link.org/ \
		http://miwibox.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Suite of tools used to connect and sync your Palm handled

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt

USE_BZIP2=	yes
USE_ICONV=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
CFLAGS+=	-I${WRKSRC}/popt -I${LOCALBASE}/include
CONFIGURE_ARGS+=--with-libiconv=${LOCALBASE}  --with-included-popt --enable-conduits --enable-xsltproc
USE_LDCONFIG=	yes

OPTIONS=	PNG "build with png support" off \
		THREADS "built-in thread safety" on \
		USB "Compile with USB via libusb support (READ MANUAL!)" off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--enable-threads
CFLAGS+=		${PTHREAD_LIBS}
CONFIGURE_ENV+=		PTHREAD_LIBS="${PTHREAD_LIBS}" PTHREAD_CFLAGS="${PTHREAD_CFLAGS}"
.endif

.if defined(WITH_USB)
. if ${OSVERSION} < 4015
LIB_DEPENDS+=	usb-0.1.8:${PORTSDIR}/devel/libusb
. endif
CONFIGURE_ARGS+=--enable-libusb
LDFLAGS+=	-L${PREFIX}/lib -lusb

.if defined(WITHOUT_THREADS)
IGNORE=		cannot be built: USB support requires THREADS turned on.  Please reconfigure using 'make config'
.else
LDFLAGS+=	${PTHREAD_LIBS}
.endif
.endif

.if defined(WITH_PNG)
LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=	--with-libpng=${PREFIX}
.else
CONFIGURE_ARGS+=	--disable-png
.endif

.include "${.CURDIR}/manpages.mk"

post-patch:
	@${REINPLACE_CMD} -e 's|png_voidp_NULL|NULL|g' \
		-e 's|png_error_ptr_NULL|NULL|g' \
		${WRKSRC}/src/pilot-read-notepad.c \
		${WRKSRC}/src/pilot-read-palmpix.c \
		${WRKSRC}/src/pilot-read-screenshot.c \
		${WRKSRC}/src/pilot-read-veo.c
.if !defined(WITHOUT_THREADS)
	@${REINPLACE_CMD} -e 's|Libs: |Libs: ${PTHREAD_LIBS} |' ${WRKSRC}/pilot-link.pc.in ${WRKSRC}/pilot-link-pp.pc.in
.endif

.include <bsd.port.post.mk>
