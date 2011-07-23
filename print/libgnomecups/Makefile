# $MidnightBSD: mports/print/libgnomecups/Makefile,v 1.6 2011/02/02 21:18:50 laffer1 Exp $

PORTNAME=	libgnomecups
PORTVERSION=	0.2.3
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	print gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support library for gnome cups admistration
LICENSE=	gpl2

LIB_DEPENDS=	cups.2:${PORTSDIR}/print/cups-base

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack ltverhack glib20
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=  libtool
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
