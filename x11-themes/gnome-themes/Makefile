# New ports collection makefile for:	gnome-themes
# Date Created:				05 October 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-themes/gnome-themes/Makefile,v 1.2 2008/03/31 00:37:30 laffer1 Exp $
# $FreeBSD: ports/x11-themes/gnome-themes/Makefile,v 1.43 2007/05/19 20:30:10 flz Exp $
#   $MCom: ports/x11-themes/gnome-themes/Makefile,v 1.116 2007/03/15 03:20:01 marcus Exp $
#

PORTNAME=	gnome-themes
PORTVERSION=	2.22.2
PORTREVISION=	1
CATEGORIES=	x11-themes gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of themes and icons for GNOME2

BUILD_DEPENDS=	gtk-engines2>=2.9.0:${PORTSDIR}/x11-themes/gtk-engines2 \
		icon-naming-utils>=0.8.0:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	gtk-engines2>=2.9.0:${PORTSDIR}/x11-themes/gtk-engines2

CONFLICTS=	clearlooks-metacity-0.*

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack metacity libgnomeui 
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
