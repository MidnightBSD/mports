# $MidnightBSD: mports/security/gnome-keyring/Makefile,v 1.8 2010/08/01 05:30:57 laffer1 Exp $

PORTNAME=	gnome-keyring
PORTVERSION=	2.30.3
PORTREVISION=	1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets
LICENSE=	gpl2

LIB_DEPENDS=	gnome-keyring.0:${PORTSDIR}/security/libgnome-keyring

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gtk20 ltverhack intlhack gconf2
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-pam-dir="${PREFIX}/lib"
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
GCONF_SCHEMAS=	gnome-keyring.schemas

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/dbus-1/services/

.include <bsd.port.mk>
