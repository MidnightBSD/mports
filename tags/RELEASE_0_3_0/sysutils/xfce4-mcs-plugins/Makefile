# New ports collection makefile for:	xfce-mcs-plugins
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/xfce4-mcs-plugins/Makefile,v 1.44 2008/06/06 14:03:24 edwin Exp $

PORTNAME=	xfce4-mcs-plugins
PORTVERSION=	4.4.2
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfce-mcs-plugins-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 settings manager plugins
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui mcsmanager
USE_XORG=	x11 xext

.include <bsd.port.mk>
