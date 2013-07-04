# $MidnightBSD: mports/games/goonies/Makefile,v 1.4 2009/10/03 00:21:03 laffer1 Exp $

PORTNAME=	goonies
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	http://goonies.jorito.net/download/ \
		http://mirror.amdmi3.ru/distfiles/
DISTNAME=	${PORTNAME}_r${PORTVERSION:C/\./-/g}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Remake of the 8 bit classic game 'The Goonies'
LICENSE=	unknown

USE_GMAKE=	yes
USE_SDL=	sdl mixer image
USE_GL=		yes

BUILD_WRKSRC=	${WRKSRC}/src
MAKEFILE=	../build/linux/Makefile
MAKE_ENV=	DATADIR="${DATADIR}"

DATADIRS=	sound graphics maps
PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		Does not compile on sparc64
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|__APPLE__|__FreeBSD__|' \
		${WRKSRC}/src/SFXManager.cpp
	@${REINPLACE_CMD} -e 's|sound/|${DATADIR}/sound/|g' \
		${WRKSRC}/src/SFXManager.cpp
	@${REINPLACE_CMD} -e 's|graphics/|${DATADIR}/graphics/|g' \
		${WRKSRC}/src/GLTManager.cpp ${WRKSRC}/src/TheGooniesApp.cpp
	@${REINPLACE_CMD} -e 's|maps/|${DATADIR}/maps/|g' \
		${WRKSRC}/src/TheGoonies.cpp

do-install:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/goonies ${PREFIX}/bin
	cd ${WRKSRC} && \
		${FIND} ${DATADIRS} -type d -exec ${MKDIR} ${DATADIR}/{} \; ;\
		${FIND} ${DATADIRS} -type f -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
