# New ports collection makefile for: midnightbsd-desktop
# Date created:		September 24, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/misc/midnightbsd-desktop/Makefile,v 1.1 2008/07/04 21:42:09 laffer1 Exp $
#

PORTNAME=	midnightbsd-backgrounds
PORTVERSION=	1.0
CATEGORIES=	x11-themes graphics gnome kde
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/
DISTFILES=	dtps.tar.bz2

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment
LICENSE=	agg

USE_BZIP2=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/dtps

BACKGROUNDS=	MidnightBSD-Space.jpg mnbsd_bg_gray.png mnbsd_bg_purple.png mnbsd_bg_black.png mnbsd_bg_green.png mnbsd_bg_yellow.png mnbsd_bg_blue.png mnbsd_bg_pink.png

do-install:
	${MKDIR} ${PREFIX}/share/wallpapers
.for b in ${BACKGROUNDS}
	${INSTALL_DATA}	 ${WRKSRC}/${b} ${PREFIX}/share/wallpapers/${b}
	${INSTALL_DATA}  ${WRKSRC}/${b}.desktop ${PREFIX}/share/wallpapers/${b}.desktop
.endfor

.include <bsd.port.mk>
