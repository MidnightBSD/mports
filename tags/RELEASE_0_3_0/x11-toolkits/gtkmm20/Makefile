# $MidnightBSD: mports/x11-toolkits/gtkmm20/Makefile,v 1.6 2009/09/20 03:10:02 laffer1 Exp $

PORTNAME=	gtkmm
PKGNAMESUFFIX=	20
PORTVERSION=	2.2.12
PORTREVISION?=	9
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME/sources/${PORTNAME}/2.2
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+, Pango, Atk, and Glib
LICENSE=	lgpl

USE_BZIP2=	yes
LATEST_LINK=	gtkmm2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	sigc-1.2.5:${PORTSDIR}/devel/libsigc++12
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_XORG=	x11
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack lthack gtk20
CONFIGURE_ARGS=	--enable-static=yes \
		--with-sigc-prefix=${LOCALBASE}

post-patch:
	@${REINPLACE_CMD} -e 's|glib/gmessages.h|glib/gtestutils.h|g' \
		${WRKSRC}/glib/src/*.ccg ${WRKSRC}/glib/glibmm/*.* \
		${WRKSRC}/gtk/src/*.* ${WRKSRC}/gtk/gtkmm/*.* \
		${WRKSRC}/demos/gtk-demo/*.cc
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/${d}//' ${WRKSRC}/Makefile.in
.endfor

.include <bsd.port.mk>

.endif
