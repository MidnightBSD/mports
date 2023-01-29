PORTNAME=	exiv2
DISTVERSION=	0.27.5
DISTVERSIONSUFFIX=	-Source
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/Exiv2/exiv2/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exif, IPTC, and XMP metadata manipulation library and tools
WWW=		https://www.exiv2.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		cmake compiler:c++11-lang cpe dos2unix gettext-tools pathfix \
		python:3.6+,test localbase:ldflags
USE_LDCONFIG=	yes
DOS2UNIX_FILES=	cmake/compilerFlags.cmake

LDFLAGS+=	-lintl

CMAKE_ON=	EXIV2_ENABLE_VIDEO
CMAKE_OFF=	EXIV2_ENABLE_LIBXMP

OPTIONS_DEFINE=	NLS SAMPLE
OPTIONS_SUB=	yes

NLS_CMAKE_BOOL=	EXIV2_ENABLE_NLS
NLS_USES=	gettext-runtime

SAMPLE_DESC=	Include sample applications
SAMPLE_CMAKE_BOOL=	EXIV2_BUILD_SAMPLES

PATHFIX_CMAKELISTSTXT=	CMakeChecks.txt

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-Source

.include <bsd.mport.options.mk>

LDFLAGS_mips=		-lintl
LDFLAGS_mips64=		-lintl

post-patch:
	@${REINPLACE_CMD} -e 's|python3|${PYTHON_CMD}|' \
		${WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|python3|${PYTHON_CMD}|' \
		${WRKSRC}/test/Makefile
	@${REINPLACE_CMD} -e 's|python3|${PYTHON_CMD}|' \
		${WRKSRC}/test/functions.source
	${REINPLACE_CMD} -e 's|FreeBSD|MidnightBSD|g' \
		${WRKSRC}/src/CMakeLists.txt ${WRKSRC}/test/Makefile \
		${WRKSRC}/test/functions.source \
		${WRKSRC}/cmake/packaging.cmake

.include <bsd.port.mk>
