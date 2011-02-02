# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11-toolkits/libxfce4gui/Makefile,v 1.4 2009/09/20 02:47:36 smultron Exp $
# $FreeBSD: ports/x11-toolkits/libxfce4gui/Makefile,v 1.43 2008/08/30 05:26:23 kan Exp $
#

PORTNAME=	libxfce4gui
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-toolkits xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	libxfcegui4-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 widget library required by xfce4 and xfwm4
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget gtk20 intltool intlhack pkgconfig libglade2
USE_LDCONFIG=	yes
USE_XFCE=	libutil xfconf
USE_XORG=	sm

CONFIGURE_ARGS= --disable-gtk-doc

.include <bsd.port.mk>
