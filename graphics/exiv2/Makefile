# $MidnightBSD$

PORTNAME=	exiv2
DISTVERSION=	0.26
DISTVERSIONSUFFIX=	-trunk
PORTEPOCH=	1
CATEGORIES=	graphics
MASTER_SITES=	http://www.exiv2.org/builds/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exif and Iptc metadata manipulation library and tools

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		cmake:outsource cpe gettext iconv pathfix
USE_LDCONFIG=	yes

CMAKE_ON=	EXIV2_ENABLE_VIDEO \
		EXIV2_ENABLE_BUILD_PO
CMAKE_OFF=	EXIV2_ENABLE_BUILD_SAMPLES \
		EXIV2_ENABLE_LIBXMP

PATHFIX_CMAKELISTSTXT=	CMakeChecks.txt

CFLAGS_powerpc64=	-mminimal-toc

WRKSRC=		${WRKDIR}/${PORTNAME}-trunk

post-install:
	${CP} ${FAKE_DESTDIR}/${TRUE_PREFIX}/lib/pkgconfig/exiv2.pc ${PREFIX}/libdata/pkgconfig/
	${CP} ${FAKE_DESTDIR}/${TRUE_PREFIX}/lib/pkgconfig/exiv2.lsm ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
