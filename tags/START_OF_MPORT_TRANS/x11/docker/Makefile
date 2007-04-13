# New ports collection makefile for:	docker
# Date created:				March 15, 2003
# Whom:					Samy Al Bahra <samy@kerneled.org>
#
# $MidnightBSD: mports/x11/docker/Makefile,v 1.1 2006/10/02 03:55:53 archite Exp $
# $FreeBSD: ports/x11/docker/Makefile,v 1.9 2006/04/15 22:21:14 cperciva Exp $
#

PORTNAME=	docker
PORTVERSION=	1.5
PORTREVISION=	5
CATEGORIES=	x11
MASTER_SITES=	http://www.kerneled.org/files/FreeBSD-ports/ \
		http://icculus.org/openbox/2/docker/

MAINTAINER=	sbahra@kerneled.org
COMMENT=	A dockapp with support for GNOME2 and KDE3 tray icons

PLIST_FILES=	bin/docker
USE_GMAKE=	yes
USE_XLIB=	yes
USE_GNOME=	glib20

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
