# $MidnightBSD$

PORTNAME=	atkmm
PORTVERSION=	2.22.6
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for ATK API library
LICENSE=	lgpl

USES=		gmake pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	atk glibmm
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-documentation

.include <bsd.port.mk>
