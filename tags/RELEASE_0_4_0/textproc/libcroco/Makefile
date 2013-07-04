# $MidnightBSD: mports/textproc/libcroco/Makefile,v 1.5 2011/02/02 21:23:47 laffer1 Exp $

PORTNAME=	libcroco
PORTVERSION=	0.6.8
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS2 parsing library
LICENSE=	lgpl

USE_XZ=		yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 libxml2 ltverhack
USE_PKGCONFIG=	build
CONFIGURE_ARGS=	--disable-gtk-doc-html

PLIST_SUB=	VERSION="0.6"

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4016
CONFIGURE_ARGS+=--disable-Bsymbolic
.endif

.include <bsd.port.post.mk>
