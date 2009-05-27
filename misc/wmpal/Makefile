# New ports collection makefile for:	wmpal
# Date created:				20 April 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/misc/wmpal/Makefile,v 1.2 2007/03/22 04:49:32 ctriv Exp $
# $FreeBSD: ports/misc/wmpal/Makefile,v 1.11 2006/03/07 08:26:54 ade Exp $
#

PORTNAME=	wmpal
PORTVERSION=	0.5
PORTREVISION=	4
CATEGORIES=	misc windowmaker
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A one of the most useless dockapps in the world
LICENSE=        gpl2
LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

USE_XLIB=	yes
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include" \
		LDFLAGS="-L${X11BASE}/lib"

.include <bsd.port.mk>
