# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/pangox-compat/Makefile 345143 2014-02-19 20:21:58Z kwm $

PORTNAME=	pangox-compat
PORTVERSION=	0.0.2
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Depricated pangoX support

LICENSE=	lgpl

BUILD_DEPENDS=	pango>=1.34.0:${PORTSDIR}/x11-toolkits/pango

USE_XZ=		yes
USE_XORG=	x11 ice
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USES=		gmake pathfix pkgconfig
USE_GNOME=	glib20 pango
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
