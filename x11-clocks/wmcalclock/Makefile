PORTNAME=	wmCalClock
PORTVERSION=	1.26
PORTREVISION=	2
CATEGORIES=	x11-clocks windowmaker
MASTER_SITES=	http://jmpacquet.free.fr/wmcalclock/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another Window Maker calendar/clock dockapp
WWW=		http://jmpacquet.free.fr/wmcalclock/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/../COPYING

FAKE_OPTS=	trueprefix

WRKSRC=		${WRKDIR}/${DISTNAME}/Src

USES=		xorg
MAKE_ENV=	OPSYS=FreeBSD
USE_XORG=	x11 xext xpm
PORTDOCS=	BUGS CHANGES HINTS INSTALL README TODO

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKDIR}/${DISTNAME} && \
		${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
