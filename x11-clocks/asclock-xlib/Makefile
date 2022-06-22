PORTNAME=	asclock-xlib
PORTVERSION=	2.0.11
CATEGORIES=	x11-clocks
MASTER_SITES=	FREEBSD_LOCAL/kuriyama

MAINTAINER=	ports@FreeBSD.org
COMMENT=	New flavor of asclock

LICENSE=	gpl2

CONFLICTS_INSTALL=	asclock

MAKE_JOBS_UNSAFE=	yes

WRKSRC=		${WRKDIR}/asclock-xlib
USES=		imake xorg
USE_XORG=	xpm x11

.include <bsd.port.pre.mk>

post-patch:
	@(cd ${WRKSRC}; \
	  ${MV} config.c config.c.tmp; \
	  ${SED} -e s@/usr/local/@${PREFIX}/@ -e s@/usr/share/asclock@${PREFIX}/share/asclock@ < config.c.tmp > config.c )

pre-configure:
	@(cd ${WRKSRC}; \
	  ${LN} -sf themes/Orb default_theme)

post-install:
.for i in Freeamp Newstone Orb Stone beats classic penguin shaped
	(cd ${WRKSRC}/themes/${i}; \
	  ${MKDIR} ${STAGEDIR}${PREFIX}/share/asclock/${i}; \
	  ${INSTALL_DATA} *.xpm config ${STAGEDIR}${PREFIX}/share/asclock/${i}/ )
.endfor

.include <bsd.port.post.mk>
