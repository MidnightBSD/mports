#
# $MidnightBSD: mports/print/libspectre/Makefile,v 1.3 2010/09/04 19:52:04 laffer1 Exp $
#    $MCom: ports/print/libspectre/Makefile,v 1.2 2008/03/13 16:30:50 ahze Exp $

PORTNAME=	libspectre
PORTVERSION=	0.2.6
CATEGORIES=	print
MASTER_SITES=	http://libspectre.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small library for rendering Postscript documents
LICENSE=	gpl2

LIB_DEPENDS=	cairo.2:${PORTSDIR}/graphics/cairo

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gnomeprefix ltverhack
USE_GHOSTSCRIPT=yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
