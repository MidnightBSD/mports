# New ports collection makefile for:	xfce4-appfinder
# Date created:				12 October 2004
# Whom:					Oliver Lehmann <oliver@FreeBSD.org>
#
# $MidnightBSD: mports/misc/xfce4-appfinder/Makefile,v 1.1 2008/09/26 18:12:06 laffer1 Exp $
# $FreeBSD: ports/misc/xfce4-appfinder/Makefile,v 1.17 2008/06/06 13:45:39 edwin Exp $
#

PORTNAME=	xfce4-appfinder
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	misc xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find application in the system supporting Desktop entry format
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig 
USE_XFCE=	configenv libgui libmenu thunar

.include <bsd.port.mk>
