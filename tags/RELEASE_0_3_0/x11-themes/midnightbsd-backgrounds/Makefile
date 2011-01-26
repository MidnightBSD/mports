# New ports collection makefile for: midnightbsd-desktop
# Date created:		September 24, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11-themes/midnightbsd-backgrounds/Makefile,v 1.2 2008/10/24 17:29:18 laffer1 Exp $
#

PORTNAME=	midnightbsd-backgrounds
PORTVERSION=	1.2
CATEGORIES=	x11-themes graphics gnome kde
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment
LICENSE=	agg

USE_BZIP2=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

BACKGROUNDS=	BSDkeyboard.jpg bsdheart.jpg mnbsd_bsdgurl1.jpg mnbsd_bsdgurl2.jpg MidnightBSD-Space.jpg mnbsd_bg_gray.png mnbsd_bg_purple.png mnbsd_bg_black.png mnbsd_bg_green.png mnbsd_bg_yellow.png mnbsd_bg_blue.png mnbsd_bg_pink.png

do-install:
	${MKDIR} ${PREFIX}/share/wallpapers
.for b in ${BACKGROUNDS}
	${INSTALL_DATA}	 ${WRKSRC}/${b} ${PREFIX}/share/wallpapers/${b}
	${INSTALL_DATA}  ${WRKSRC}/${b}.desktop ${PREFIX}/share/wallpapers/${b}.desktop
.endfor

.include <bsd.port.mk>
