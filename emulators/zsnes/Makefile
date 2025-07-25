PORTNAME=	zsnes
PORTVERSION=	1.51
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/ZSNES%20v${PORTVERSION}
DISTNAME=	zsnes${PORTVERSION:S/.//}src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intel x86 only Super Nintendo Entertainment System (SNES) Emulator
WWW=		https://www.zsnes.com/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/../docs/license.txt

ONLY_FOR_ARCHS=	i386
ONLY_FOR_ARCHS_REASON=	non-portable

BUILD_DEPENDS=	nasm:devel/nasm
LIB_DEPENDS=	libpng.so:graphics/png

USES=		gmake localbase sdl tar:bzip2
USE_SDL=	sdl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-cpucheck

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION:S/./_/}/src

PLIST_FILES=	bin/zsnes share/man/man1/zsnes.1.gz

NO_OPTIONS_SORT=yes
OPTIONS_DEFINE=	X11 OPENGL DEBUGGER JMA AO
OPTIONS_DEFAULT=X11 JMA
DEBUGGER_DESC=	ZSNES Debugger
JMA_DESC=	JMA support

DEBUGGER_CONFIGURE_ENABLE=	debugger
JMA_CONFIGURE_ENABLE=	jma
X11_CONFIGURE_WITH=	x
OPENGL_CONFIGURE_ENABLE=	opengl

AO_LIB_DEPENDS=	libao.so:audio/libao
AO_CONFIGURE_ENABLE=	libao

post-patch:
	@${REINPLACE_CMD} -e \
		's|@CXX@ @CFLAGS@ -o|@CXX@ @CXXFLAGS@ @CPPFLAGS@ -o|g ; \
		 s|@CC@ @CFLAGS@ -o|@CC@ @CFLAGS@ @CPPFLAGS@ -o|g' \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -i "" -e \
		's|-O3||g' ${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} -e 's|size_t argc|int argc|g' \
		${WRKSRC}/parsegen.cpp ${WRKSRC}/tools/depbuild.cpp \
		${WRKSRC}/tools/extraext.cpp ${WRKSRC}/tools/macroll.cpp \
		${WRKSRC}/tools/minwhite.cpp ${WRKSRC}/tools/nreplace.cpp \
		${WRKSRC}/tools/varrep.cpp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zsnes ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/linux/zsnes.1 ${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
