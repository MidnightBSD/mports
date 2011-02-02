# $MidnightBSD: mports/security/libgnome-keyring/Makefile,v 1.4 2010/12/09 00:55:20 laffer1 Exp $

PORTNAME=	libgnome-keyring
PORTVERSION=	2.30.1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets
LICENSE=	gpl2

BUILD_DEPENDS=	gnome-config:${PORTSDIR}/x11/gnome-libs

LIB_DEPENDS=    tasn1.4:${PORTSDIR}/security/libtasn1 \
                gcrypt.17:${PORTSDIR}/security/libgcrypt \
		dbus-1.3:${PORTSDIR}/devel/dbus \
		eggdbus-1.0:${PORTSDIR}/devel/eggdbus

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix ltverhack intlhack gconf2
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
