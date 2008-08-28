# New ports collection makefile for:	libgweather
# Date created:				14th Jan 2008
# Whom:					Koop Mast <kwm@FreeBSD.org>
#
# $FreeBSD: ports/net/libgweather/Makefile,v 1.4 2008/05/26 22:25:03 mezz Exp $
#   $MCom: ports/net/libgweather/Makefile,v 1.7 2008/03/11 11:45:48 ahze Exp $
# $MidnightBSD$

PORTNAME=	libgweather
PORTVERSION=	2.22.2
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to accessing online weather informations
LICENSE=        gpl2     
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gtk20 gnomevfs2 ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gweather.schemas

.include <bsd.port.mk>
