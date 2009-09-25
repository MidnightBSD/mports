# $MidnightBSD: mports/net/libgweather/Makefile,v 1.2 2009/09/20 01:44:52 laffer1 Exp $

PORTNAME=	libgweather
PORTVERSION=	2.26.2.1
PORTREVISION=	1
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to accessing online weather informations
LICENSE=	gpl2

LIB_DEPENDS=	soup-2.4.1:${PORTSDIR}/devel/libsoup

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gtk20 gnomevfs2 ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gweather.schemas

.include <bsd.port.mk>
