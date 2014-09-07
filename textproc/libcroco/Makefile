# $MidnightBSD$

PORTNAME=	libcroco
PORTVERSION=	0.6.8
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS2 parsing library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 libxml2 ltverhack
USES=		pkgconfig gettext gmake tar:xz
CONFIGURE_ARGS=	--disable-gtk-doc-html

PLIST_SUB=	VERSION="0.6"

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4016
CONFIGURE_ARGS+=--disable-Bsymbolic
.endif

.include <bsd.port.post.mk>
