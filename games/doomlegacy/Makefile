PORTNAME=	doomlegacy
PORTVERSION=	1.48.12
PORTEPOCH=	1
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/${DISTVERSION:S,_,%20,}/
DISTNAME=	${PORTNAME}_${DISTVERSION}_source
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}_${DISTVERSION}_common.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Improved and extended version of Doom
WWW=		https://doomlegacy.sourceforge.net/

LICENSE=	gpl2

USES=		gl gmake sdl tar:bzip2
USE_GL=		gl glu
USE_SDL=	mixer sdl

PLIST_FILES=	bin/${PORTNAME} share/doom/dogs.wad share/doom/legacy.wad
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFINE_i386=	ASM
ASM_BROKEN=	segmentation fault in ASM_PatchRowBytes()

.if exists(/usr/include/netipx/ipx.h)
OPTIONS_DEFINE+=	IPX
IPX_DESC=	IPX protocol support
.endif

ASM_BUILD_DEPENDS=	nasm:devel/nasm
ASM_MAKE_ENV=		USEASM=1

.include <bsd.mport.options.mk>

post-patch: .SILENT
# Adjust default WAD search path
	${REINPLACE_CMD} -e '/DEFWADS04/s|/.*|${DMDIR}"|' \
		${WRKSRC}/src/doomdef.h
.if ! ${PORT_OPTIONS:MIPX}
	${REINPLACE_CMD} -e '/USE_IPX/s|define|undef|' ${WRKSRC}/src/doomdef.h
	${REINPLACE_CMD} -e 's| -lipx||' ${WRKSRC}/src/Makefile
.endif

pre-build:
	${ECHO_CMD} CC_ENVIRONMENT=1 OS=FREEBSD | \
		${XARGS} -n 1 >> ${BUILD_WRKSRC}/make_options
	${MAKE_CMD} -C ${BUILD_WRKSRC} dirs
	${MAKE_CMD} -C ${BUILD_WRKSRC} depend

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/doomlegacy ${PREFIX}/bin
	@${MKDIR} ${FAKE_DESTDIR}${DMDIR}
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}_${PORTVERSION}_common/*.wad \
		${FAKE_DESTDIR}${DMDIR}
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${DOCSDIR})

.include "${.CURDIR}/../doom-data/Makefile.include"
.include <bsd.port.mk>
