# New ports collection makefile for:	gnomeutils2
# Date created:				06 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/deskutils/gnome-utils/Makefile,v 1.2 2008/04/01 03:51:40 laffer1 Exp $
# $FreeBSD: ports/deskutils/gnome-utils/Makefile,v 1.93 2007/07/23 09:35:37 rafan Exp $
#   $MCom: ports/deskutils/gnome-utils/Makefile,v 1.115 2007/03/11 20:46:37 mezz Exp $
#

PORTNAME=	gnome-utils
PORTVERSION=	2.20.0.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 support utilities
LICENSE=	gpl2

LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
GNOME_DESKTOP_VERSION=2
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomepanel \
		libgnomeprintui gnomedesktop ltverhack
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-dictionary.1 gnome-search-tool.1 gnome-system-log.1 \
		baobab.1
GCONF_SCHEMAS=	gnome-dictionary.schemas gnome-screenshot.schemas \
		gnome-search-tool.schemas logview.schemas baobab.schemas

.include <bsd.port.mk>
