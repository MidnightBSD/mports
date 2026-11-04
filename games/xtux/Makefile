PORTNAME=	xtux
PORTVERSION=	20030306
CATEGORIES=	games
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-src-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Humorous Arcade game for X
WWW=		https://xtux.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		gmake xorg
USE_XORG=	xpm
MAKE_ENV=	CPP="${CC} -E"

CFLAGS+=	-DDATADIR=\\\"${DATADIR}\\\"

MAKE_JOBS_UNSAFE=yes

PLIST_FILES=	bin/tux_serv bin/xtux
PORTDATA=	*
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${FIND} ${WRKSRC}/src -name "Makefile" | ${XARGS} ${REINPLACE_CMD} -e \
		's|^CC|#CC|g ; \
		 s|^CFLAGS|#CFLAGS|g ; \
		 s|^CPP|#CPP|g ; \
		 s|^MAKE|#MAKE|g ; \
		 s|/usr/X11R6|$${LOCALBASE}|g'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtux ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tux_serv ${PREFIX}/bin

	@${MKDIR} ${DATADIR}/demos
	@${MKDIR} ${DATADIR}/images/entities
	@${MKDIR} ${DATADIR}/images/events
	@${MKDIR} ${DATADIR}/images/items
	@${MKDIR} ${DATADIR}/images/weapons
	@${MKDIR} ${DATADIR}/images/tiles
	@${MKDIR} ${DATADIR}/maps

	${INSTALL_DATA} ${WRKSRC}/data/*.table ${DATADIR}
.for file in ascii.txt bios entities weapons
	${INSTALL_DATA} ${WRKSRC}/data/${file} ${DATADIR}
.endfor
.for dir in entities events items weapons tiles .
	${INSTALL_DATA} ${WRKSRC}/data/images/${dir}/*.xpm \
		${DATADIR}/images/${dir}
.endfor
	${INSTALL_DATA} ${WRKSRC}/data/demos/*.xtdem ${DATADIR}/demos
	${INSTALL_DATA} ${WRKSRC}/data/maps/*.map ${DATADIR}/maps

do-install-DOCS-on:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.mk>
