# New ports collection makefile for: midnightbsd-desktop
# Date created:		September 24, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	midnightbsd-backgrounds
PORTVERSION=	1.2
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	agg

USES=		tar:bzip2
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
