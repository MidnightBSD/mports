# New ports collection makefile for:	docker
# Date created:				March 15, 2003
# Whom:					Samy Al Bahra <samy@kerneled.org>
#
# $MidnightBSD: mports/x11/docker/Makefile,v 1.2 2007/03/25 02:43:28 ctriv Exp $
# $FreeBSD: ports/x11/docker/Makefile,v 1.9 2006/04/15 22:21:14 cperciva Exp $
#

PORTNAME=	docker
PORTVERSION=	1.5
PORTREVISION=	5
CATEGORIES=	x11
MASTER_SITES=	http://www.kerneled.org/files/FreeBSD-ports/ \
		http://icculus.org/openbox/2/docker/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockapp with support for GNOME2 and KDE3 tray icons
LICENSE=	gpl2

PLIST_FILES=	bin/docker
USE_GMAKE=	yes
USE_XORG=	x11
USE_GNOME=	glib20

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
