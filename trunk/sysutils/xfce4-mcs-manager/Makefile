# New ports collection makefile for:	xfce-mcs-manager
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/xfce4-mcs-manager/Makefile,v 1.34 2008/06/06 14:03:24 edwin Exp $
#

PORTNAME=	xfce4-mcs-manager
PORTVERSION=	4.4.2
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfce-mcs-manager-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 settings manager
LICENSE=	lgpl

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui libmcs

.include <bsd.port.mk>
