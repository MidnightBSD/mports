# New ports collection makefile for:	gnomedesktop
# Date created:				13 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-desktop/Makefile,v 1.2 2008/03/14 01:58:17 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-desktop/Makefile,v 1.63 2007/07/03 07:27:20 marcus Exp $
#   $MCom: ports/x11/gnome-desktop/Makefile,v 1.112 2007/03/13 12:15:44 ahze Exp $
#

PORTNAME=	gnome-desktop
PORTVERSION=	2.22.1
PORTREVISION?=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-desktop/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

RUN_DEPENDS=	${pygnome2_DETECT}:${PORTSDIR}/x11-toolkits/py-gnome2

USE_XORG=	xpm
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui gnomedocutils \
		ltverhack referencehack
GNOME_DESKTOP_VERSION=2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_PYTHON=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD" \
		--with-kde-datadir=${LOCALBASE}/share
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=	gnome-about.1

.include <bsd.port.mk>

.endif
