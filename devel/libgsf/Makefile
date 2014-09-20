# $FreeBSD: ports/devel/libgsf/Makefile,v 1.31 2006/05/13 07:37:04 marcus Exp $
# $MidnightBSD$

PORTNAME=	libgsf
PORTVERSION=	1.14.28
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Extensible i/o abstraction for dealing with structured file formats

LICENSE=	gpl2

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gdkpixbuf2 glib20 gnomeprefix intlhack introspection:build \
		libxml2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
