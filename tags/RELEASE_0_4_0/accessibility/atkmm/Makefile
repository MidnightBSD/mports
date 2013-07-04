# $MidnightBSD: mports/accessibility/atkmm/Makefile,v 1.2 2012/02/29 02:26:15 laffer1 Exp $

PORTNAME=	atkmm
PORTVERSION=	2.22.6
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for ATK API library
LICENSE=	lgpl

USE_XZ=		yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_GNOME=	gnomehack atk glibmm
USE_PKGCONFIG=	build
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-documentation

.include <bsd.port.mk>
