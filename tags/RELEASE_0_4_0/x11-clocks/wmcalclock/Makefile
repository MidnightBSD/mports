# $MidnightBSD: mports/x11-clocks/wmcalclock/Makefile,v 1.9 2013/02/23 23:42:14 laffer1 Exp $

PORTNAME=	wmCalClock
PORTVERSION=	1.26
PORTREVISION=	2
CATEGORIES=	x11-clocks windowmaker
MASTER_SITES=	http://jmpacquet.free.fr/wmcalclock/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another Window Maker calendar/clock dockapp
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${DISTNAME}/Src

USE_XORG=	x11 xpm
PORTDOCS=	BUGS CHANGES HINTS INSTALL README TODO

MAN1=		wmCalClock.1

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKDIR}/${DISTNAME} && \
		${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
