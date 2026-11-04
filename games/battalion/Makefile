PORTNAME=	battalion
PORTVERSION=	1.4b
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://www.evl.uic.edu/aej/BATTALION/
DISTNAME=	${PORTNAME}${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} battalionSUN4.tar.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monsters, explosions, destruction game for X Window System
WWW=		https://www.evl.uic.edu/aej/AndyBattalion.html

LICENSE=	batallion
LICENSE_NAME=	batallion license
LICENSE_FILE=	${WRKSRC}/README
# non-commercial and prohibits distribution of modified versions
LICENSE_PERMS=	dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

USES=		gl tar:bzip2 localbase xorg
USE_GL=		gl glu
USE_XORG=	x11
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" LIBS="${LIBS}"

CFLAGS+=	-I${LOCALBASE}/include/X11 \
		-DLINUXVERSION -DLINUXAUDIO
LIBS+=		-lX11 -lm

PLIST_FILES=	bin/${PORTNAME} share/man/man6/${PORTNAME}.6.gz
PORTDATA=	*
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-extract:
	@${GZCAT} ${DISTDIR}/battalionSUN4.tar.gz | \
		(cd ${WRKDIR} && ${TAR} --unlink -xf -)
	@${RM} ${WRKSRC}/*.o

post-patch:
	@${REINPLACE_CMD} -e \
		'/dataPtr/s| = getenv.*| = "${DATADIR}";|' ${WRKSRC}/battalion.c
	@${REINPLACE_CMD} -e \
		's|<malloc\.h>|<stdlib.h>| ; \
		 s|<linux/soundcard\.h>|<sys/soundcard.h>|' ${WRKSRC}/soundIt.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/battalion ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/battalionSUN4/battalion.man \
		${PREFIX}/share/man/man6/battalion.6
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKDIR}/battalionSUN4/battalion.data/battalion.sho \
		${DATADIR}
	@${MKDIR} ${DATADIR}/DATA
	${INSTALL_DATA} ${WRKSRC}/DATA/*.data ${DATADIR}/DATA
	@${MKDIR} ${DATADIR}/MUSIC
	${INSTALL_DATA} ${WRKSRC}/MUSIC/*.au ${DATADIR}/MUSIC
	@${MKDIR} ${DATADIR}/SOUNDS
	${INSTALL_DATA} ${WRKSRC}/SOUNDS/*.au ${DATADIR}/SOUNDS
	@${MKDIR} ${DATADIR}/TEXTURES
	${INSTALL_DATA} ${WRKSRC}/TEXTURES/*.tex ${DATADIR}/TEXTURES
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/battalionSUN4/HELP/*.gif ${DOCSDIR}
	${CP} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.mk>
