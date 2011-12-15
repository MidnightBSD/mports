# $MidnightBSD: mports/graphics/sane-backends/Makefile,v 1.5 2010/03/25 01:28:09 laffer1 Exp $

PORTNAME=	sane-backends
PORTVERSION=	1.0.20
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://alioth.debian.org/frs/download.php/3026/ \
		ftp://ftp.sane-project.org/pub/sane/%SUBDIR%/ \
		ftp://ftp2.sane-project.org/pub/sane/%SUBDIR%/ \
		ftp://ftp3.sane-project.org/pub/sane/%SUBDIR%/ \
		ftp://gd.tuwien.ac.at/hci/sane/%SUBDIR%/ \
		http://gd.tuwien.ac.at/hci/sane/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API for access to scanners, digitals camera, frame grabbers etc
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff
MAKE_JOBS_UNSAFE=	yes

OPTIONS=	USB "USB support" on \
		NLS "NLS support" on \
		AVAHI "avahi support" off \
		GPHOTO2 "gPhoto2 support" off

USE_GNOME=	
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--mandir=${PREFIX}/man --with-docdir=${DOCSDIR} \
		--disable-locking  --disable-latex
		
MAKE_ENV=	NOPORTDOCS=${NOPORTDOCS}
USE_LDCONFIG=	yes

.include "Makefile.man"
.include <bsd.port.pre.mk>

.if defined(WITH_AVAHI)
LIB_DEPENDS+=		avahi-client.3:${PORTSDIR}/net/avahi-app
CONFIGURE_ARGS+=	--enable-avahi
.endif

.if defined(WITHOUT_USB)
CONFIGURE_ARGS+=	--disable-libusb
.else
LIB_DEPENDS+=		usb-0.1.8:${PORTSDIR}/devel/libusb
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-translations
PLIST_SUB+=		NLS="@comment "
.else
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.endif

.if defined(WITH_GPHOTO2)
LIB_DEPENDS+=		gphoto2.2:${PORTSDIR}/graphics/libgphoto2
PLIST_SUB+=		GPHOTO2=""
.else
CONFIGURE_ARGS+=	--with-gphoto2=no
PLIST_SUB+=		GPHOTO2="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|= \.\./libtool|= @LIBTOOL@|g'
	@${REINPLACE_CMD} -e '/^for ac_header in/s|libc.h||g ; \
		s|} -D_REENT|} ${PTHREAD_CFLAGS} -D_REENT|g ; \
		s|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
