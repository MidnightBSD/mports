# New ports collection makefile for:	gnomeutils2
# Date created:				06 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/deskutils/gnome-utils/Makefile,v 1.6 2011/02/02 20:12:29 laffer1 Exp $
# $FreeBSD: ports/deskutils/gnome-utils/Makefile,v 1.93 2007/07/23 09:35:37 rafan Exp $
#   $MCom: ports/deskutils/gnome-utils/Makefile,v 1.115 2007/03/11 20:46:37 mezz Exp $
#

PORTNAME=	gnome-utils
PORTVERSION=	2.32.0
PORTEPOCH=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 support utilities
LICENSE=	gpl2

LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop \
		canberra-gtk.0:${PORTSDIR}/audio/libcanberra

USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
GNOME_DESKTOP_VERSION=2
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomepanel ltverhack
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--enable-maintainer-flags=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-dictionary.1 gnome-screenshot.1 gnome-search-tool.1 \
		gnome-system-log.1 baobab.1
GCONF_SCHEMAS=	gnome-dictionary.schemas gnome-screenshot.schemas \
		gnome-search-tool.schemas baobab.schemas \
		gnome-system-log.schemas

.include <bsd.port.mk>
