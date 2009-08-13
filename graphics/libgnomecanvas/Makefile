# $MidnightBSD: mports/graphics/libgnomecanvas/Makefile,v 1.5 2009/03/04 00:28:14 laffer1 Exp $

PORTNAME=	libgnomecanvas
PORTVERSION=	2.26.0
PORTREVISION?=	0
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphics library for GNOME
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_XORG=	x11
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack libglade2 libartlgpl2 ltverhack referencehack gail
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>

.endif
