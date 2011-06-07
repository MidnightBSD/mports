# $MidnightBSD$
# $FreeBSD: ports/devel/libgee/Makefile,v 1.5 2011/02/28 12:01:51 kwm Exp $

PORTNAME=	libgee
PORTVERSION=	0.6.1
CATEGORIES=	devel
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:R}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject collection library
LICENSE=	lgpl

BUILD_DEPENDS=	gobject-introspection>=0.9.0:${PORTSDIR}/devel/gobject-introspection

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection=yes
USE_GMAKE=	yes
USE_BZIP2=	yes
USE_GNOME=	glib20 gnomehack
USE_LDCONFIG=	yes

.include <bsd.port.mk>
