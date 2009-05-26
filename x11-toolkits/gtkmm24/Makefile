# $MidnightBSD: mports/x11-toolkits/gtkmm24/Makefile,v 1.6 2008/06/06 12:06:58 crash Exp $

PORTNAME=	gtkmm
PKGNAMESUFFIX=	24
PORTVERSION=	2.14.3
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+, Pango, Atk
LICENSE=	lgpl

USE_BZIP2=	yes
LATEST_LINK=	gtkmm24

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm \
		cairomm-1.0.1:${PORTSDIR}/graphics/cairomm \
		pangomm-1.4.1:${PORTSDIR}/x11-toolkits/pangomm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_GNOME=	gnomehack gtk20
CONFIGURE_ARGS=	--disable-demos \
		--disable-docs \
		--disable-examples \
		--enable-static=yes \
		--with-sigc-prefix=${LOCALBASE}

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/tests//' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|demo[$$][(]EXEEXT[)]|gtkmm-demo$$(EXEEXT)|g' \
	    	${WRKSRC}/demos/gtk-demo/Makefile.in

.include <bsd.port.mk>

.endif
