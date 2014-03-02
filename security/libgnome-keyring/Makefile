# $MidnightBSD$

PORTNAME=	libgnome-keyring
PORTVERSION=	2.32.0
PORTREVISION=	4
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program that keeps passwords and other secrets

LICENSE=	gpl2

LIB_DEPENDS=    tasn1.7:${PORTSDIR}/security/libtasn1 \
                gcrypt:${PORTSDIR}/security/libgcrypt

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix ltverhack intlhack gconf2
USE_GMAKE=	yes
USES=		gettext pkgconfig
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
