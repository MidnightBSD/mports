# $MidnightBSD: mports/devel/goffice04/Makefile,v 1.5 2011/03/22 22:46:00 laffer1 Exp $
# $FreeBSD: ports/devel/goffice04/Makefile,v 1.23 2008/06/06 13:21:16 edwin Exp $
#   $MCom: ports/devel/goffice/Makefile,v 1.32 2007/09/06 05:01:28 marcus Exp $
#
# !!! When updating goffice, don't forget to update science/gchempaint pkg-plists too! !!!

PORTNAME=	goffice
PORTVERSION=	0.4.3
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	04
DISTFILES=	goffice-${PORTVERSION}.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities
LICENSE=	gpl2

LIB_DEPENDS=	pcre.1:${PORTSDIR}/devel/pcre

NO_LATEST_LINK=	yes

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeprint libglade2 \
		libgsf_gnome libgnomeui ltverhack
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
