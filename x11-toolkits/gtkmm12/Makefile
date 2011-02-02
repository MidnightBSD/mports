# $MidnightBSD: mports/x11-toolkits/gtkmm12/Makefile,v 1.5 2009/09/20 03:08:46 laffer1 Exp $

PORTNAME=	gtkmm
PKGNAMESUFFIX=	12
PORTVERSION=	1.2.8
PORTREVISION=	7
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for gtk, a x11 graphics library
LICENSE=	lgpl

LIB_DEPENDS=	sigc.1:${PORTSDIR}/devel/libsigc++
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static=yes \
		--without-gnome \
		--with-sigc-prefix=${LOCALBASE}

post-install:
.for lib in gdkmm gtkmm
	@${RM} ${PREFIX}/lib/lib${lib}.so ${PREFIX}/lib/lib${lib}.la
	@${MV} ${PREFIX}/lib/lib${lib}.a ${PREFIX}/lib/lib${lib}-1.2.a
.endfor

.include <bsd.port.mk>
