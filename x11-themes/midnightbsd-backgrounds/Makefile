PORTNAME=	midnightbsd-backgrounds
PORTVERSION=	1.3
PORTREVISION=	0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	bsd2 CC-BY-NC-SA-4.0
LICENSE_COMB=	multi

USES=		tar:bz2
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

BACKGROUNDS=	BSDkeyboard.jpg bsdheart.jpg mnbsd_bsdgurl1.jpg mnbsd_bsdgurl2.jpg MidnightBSD-Space.jpg mnbsd_bg_gray.png mnbsd_bg_purple.png mnbsd_bg_black.png mnbsd_bg_green.png mnbsd_bg_yellow.png mnbsd_bg_blue.png mnbsd_bg_pink.png ai_bridge.png ai_ghostlake.png ai_harbor.png ai_holland.png ai_isle.png ai_magic.png ai_midnight_rooftop.png ai_raphmic.png midnight_fireplace.jpg


do-install:
	${MKDIR} ${PREFIX}/share/backgrounds/midnightbsd
.for b in ${BACKGROUNDS}
	${INSTALL_DATA}	 ${WRKSRC}/${b} ${PREFIX}/share/backgrounds/midnightbsd/${b}
	${INSTALL_DATA}  ${WRKSRC}/${b}.desktop ${PREFIX}/share/backgrounds/midnightbsd/${b}.desktop
.endfor
	cd ${PREFIX}/share && ${LN} -sf backgrounds wallpapers

.include <bsd.port.mk>
