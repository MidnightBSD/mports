# $MidnightBSD: mports/devel/libgee/Makefile,v 1.1 2011/06/07 02:33:01 laffer1 Exp $
# $FreeBSD: ports/devel/libgee/Makefile,v 1.5 2011/02/28 12:01:51 kwm Exp $

PORTNAME=	libgee
PORTVERSION=	0.8.5
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject collection library
LICENSE=	lgpl

BUILD_DEPENDS=	gobject-introspection>=0.9.0:${PORTSDIR}/devel/gobject-introspection

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection=yes
USE_GMAKE=	yes
USE_XZ=		yes
USE_GNOME=	glib20 gnomehier gnomehack
USES=		pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.mk>
