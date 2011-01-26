#
# $MidnightBSD: mports/x11-toolkits/libxfce4menu/Makefile,v 1.1 2009/03/12 03:25:29 ctriv Exp $
#

PORTNAME=	libxfce4menu
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-toolkits xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	libxfce4menu-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A menu library for Xfce 4
LICENSE=	
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XFCE=	configenv libutil
USE_GNOME=	gtk20 glib20 pkgconfig gnomehack gnometarget


CONFIGURE_ARGS= --disable-gtk-doc

.include <bsd.port.mk>
