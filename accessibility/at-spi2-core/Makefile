# $MidnightBSD: mports/accessibility/at-spi2-core/Makefile,v 1.1 2010/09/06 21:34:55 laffer1 Exp $

PORTNAME=	at-spi2-core
PORTVERSION=	0.4.1
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Assistive Technology Service Provider Interface
LICENSE=	lgpl

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomehier intlhack
USE_XORG=	x11 xi xtst
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
