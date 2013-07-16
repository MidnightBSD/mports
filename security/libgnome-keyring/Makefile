# $MidnightBSD: mports/security/libgnome-keyring/Makefile,v 1.6 2013/01/19 18:00:38 laffer1 Exp $

PORTNAME=	libgnome-keyring
PORTVERSION=	2.32.0
PORTREVISION=	1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets
LICENSE=	gpl2

LIB_DEPENDS=    tasn1.4:${PORTSDIR}/security/libtasn1 \
                gcrypt:${PORTSDIR}/security/libgcrypt

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix ltverhack intlhack gconf2
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
