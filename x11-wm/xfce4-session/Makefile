# New ports collection makefile for:	xfce4-session
# Date created:		2003-10-30
# Whom:			Matt Lancereau <matt@rimasec.net>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-wm/xfce4-session/Makefile,v 1.39 2008/06/06 14:17:21 edwin Exp $
#

PORTNAME=	xfce4-session
PORTVERSION=	4.4.2
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session manager for the Xfce 4 desktop environment
LICENSE=	lgpl

BUILD_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth
RUN_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libgui libmcs libutil mcsmanager
USE_XORG=	x11 sm ice

MAN1=		xfce4-session.1 xfce4-session-logout.1

.include <bsd.port.mk>
