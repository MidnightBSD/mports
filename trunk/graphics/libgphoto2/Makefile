# $MidnightBSD: mports/graphics/libgphoto2/Makefile,v 1.7 2011/06/05 15:19:43 laffer1 Exp $

PORTNAME=	libgphoto2
PORTVERSION=	2.4.10.1
CATEGORIES=	graphics
MASTER_SITES=	SF/gphoto/libgphoto/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A universal digital camera picture control tool
LICENSE=	lgpl

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb \
		exif.12:${PORTSDIR}/graphics/libexif \
		jpeg.11:${PORTSDIR}/graphics/jpeg

USE_BZIP2=	yes
USE_GNOME=	 pkgconfig ltverhack
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool libltdl
LIBTOOLFILES=	configure libgphoto2_port/configure
USE_LDCONFIG=	yes
CONFIGURE_ENV=	LTDLINCL="-I${LOCALBASE}/include" LIBLTDL="-L${LOCALBASE}/lib -lltdl"
PLIST_SUB=	VERSION="${PORTVERSION}" VERSION_PORT=0.8.0
MAKE_JOBS_SAFE=	yes

MAN3=		libgphoto2.3 libgphoto2_port.3

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
.for file in configure libgphoto2_port/configure
	@${REINPLACE_CMD} -e \
		's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g ; \
		 s|-g -O2||g ; \
		 /grep -i linux/s|; fi ; then|; else false; fi ; then|' ${WRKSRC}/${file}
.endfor
	@${REINPLACE_CMD} -e '/test.*udevscriptdir/d ; s| "$$(DESTDIR)$$(udevscriptdir)"||' ${WRKSRC}/libgphoto2_port/usb/Makefile.in ${WRKSRC}/packaging/generic/Makefile.in
	@${REINPLACE_CMD} -e 's|linux-hotplug ||' ${WRKSRC}/packaging/Makefile.in
	@${REINPLACE_CMD} -e 's|@HAVE_DOXYGEN_TRUE@|#| ; s|@HAVE_DOXYGEN_FALSE@||' ${WRKSRC}/doc/Makefile.in

.include <bsd.port.mk>
