# New ports collection makefile for:   XScreenSaver.App
# Date created:        26 September 2004
# Whom:                hemi@puresimplicity.net
#
# $FreeBSD: ports/x11/xscreensaver.app/Makefile,v 1.4 2005/11/22 22:15:02 pav Exp $
# $MidnightBSD: mports/x11/xscreensaver.app/Makefile,v 1.1 2007/03/09 02:17:46 laffer1 Exp $
#

PORTNAME=	XScreenSaver.App
PORTVERSION=	2.3
PORTREVISION=	2
CATEGORIES=	x11 windowmaker
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	xscreensaverapp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker dockapp to control XScreenSaver

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

PLIST_FILES=	bin/XScreenSaver.App
USE_XLIB=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib" \
		CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include"

MAKE_ARGS=	"LDFLAGS+=-L${X11BASE}/lib -L${LOCALBASE}/lib"

.include <bsd.port.mk>
