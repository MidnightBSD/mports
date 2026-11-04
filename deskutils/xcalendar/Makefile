PORTNAME=	xcalendar
PORTVERSION=	4.0.2008
CATEGORIES=	deskutils
MASTER_SITES=	PORTS_JP
DISTNAME=	${PORTNAME}-4.0+i18n

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Calendar with a notebook for X11 (internationalized version)

LICENSE=	mit

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		imake gmake xorg
USE_XORG=	ice sm x11 xaw xext xmu xt
MAKE_ENV=	FILESDIR=${FILESDIR}
ALL_TARGET=	all XCal-uj.ad xcalendar-uj.hlp xcalendar-uj.man

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/ja/man1

.include <bsd.port.mk>
