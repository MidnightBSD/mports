# New ports collection makefile for:   XScreenSaver.App
# Date created:        26 September 2004
# Whom:                hemi@puresimplicity.net
#
# $FreeBSD: ports/x11/xscreensaver.app/Makefile,v 1.4 2005/11/22 22:15:02 pav Exp $
# $MidnightBSD: mports/x11/xscreensaver.app/Makefile,v 1.4 2008/08/20 19:52:50 laffer1 Exp $
#

PORTNAME=	XScreenSaver.App
PORTVERSION=	2.3
PORTREVISION=	3
CATEGORIES=	x11 windowmaker
MASTER_SITES=	SF/xscreensaverapp/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker dockapp to control XScreenSaver
LICENSE=	gpl2

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

PLIST_FILES=	bin/XScreenSaver.App
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAKE_ARGS=	"LDFLAGS+=-L${LOCALBASE}/lib"

.include <bsd.port.mk>
