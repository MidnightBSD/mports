PORTNAME=	yape
PORTVERSION=	0.32.5
CATEGORIES=	emulators
MASTER_SITES=	http://yape.homeserver.hu/download/
DISTNAME=	${PORTNAME}SDL-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet Another Commodore +4 Emulator

LICENSE=        gpl3

USES=		compiler:features gmake
USE_SDL=	sdl
NO_WRKSUBDIR=	yes
ALL_TARGET=	yape

PLIST_FILES=	bin/yape
PORTDOCS=	*

post-extract:
	@${FIND} -E ${WRKDIR} -type f -iregex ".*\.(c|cpp|h|txt)" -print0 | \
		${XARGS} -0 ${REINPLACE_CMD} -e 's/[[:cntrl:]]*$$//'
	@${REINPLACE_CMD} -e 's/[[:cntrl:]]*$$//' ${WRKSRC}/Makefile

post-patch:
	@${REINPLACE_CMD} -e "s|-frerun-loop-opt||" ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e "s|sdl-config|${SDL_CONFIG}|" ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e "s|TAP::TAP|TAP|" ${WRKSRC}/tape.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/yape ${PREFIX}/bin

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.SDL ${DOCSDIR}
.endif

.include <bsd.port.mk>
