PORTNAME=	exiv2
DISTVERSIONPREFIX=	v
DISTVERSION=	0.28.2
PORTEPOCH=	1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exif, IPTC, and XMP metadata manipulation library and tools
WWW=		https://www.exiv2.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libbrotlidec.so:archivers/brotli \
		libexpat.so:textproc/expat2 \
		libinih.so:devel/inih \
		libpng.so:graphics/png

USES=		cmake compiler:c++17-lang cpe dos2unix gettext-tools iconv \
		localbase:ldflags pathfix shebangfix
DOS2UNIX_FILES=	cmake/compilerFlags.cmake
SHEBANG_FILES=	fuzz/mkdictionary.py tests/runner.py
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Exiv2

CMAKE_ON=	EXIV2_ENABLE_VIDEO
CMAKE_OFF=	EXIV2_ENABLE_EXTERNAL_XMP

LDFLAGS_mips=	-lintl
LDFLAGS_mips64=	-lintl

OPTIONS_DEFINE=	DOCS DOXYGEN NLS SAMPLE
OPTIONS_SUB=	yes

SAMPLE_DESC=	Include sample applications

DOXYGEN_BUILD_DEPENDS=	dot:graphics/graphviz \
			doxygen:devel/doxygen
DOXYGEN_CMAKE_BOOL=	EXIV2_BUILD_DOC
DOXYGEN_ALL_TARGET=	all doc
DOXYGEN_PORTDOCS=	*

NLS_USES=	gettext-runtime
NLS_CMAKE_BOOL=	EXIV2_ENABLE_NLS

SAMPLE_CMAKE_BOOL=	EXIV2_BUILD_SAMPLES

NO_TEST=	yes

.include <bsd.port.mk>
