# $MidnightBSD$

PORTNAME=	assimp
DISTVERSIONPREFIX=	v
DISTVERSION=	4.1.0
PORTREVISION=	1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to import various 3D model formats in a uniform manner

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libminizip.so:archivers/minizip

USES=		cmake compiler:c++11-lib localbase:ldflags pkgconfig
USE_GITHUB=	yes
USE_LDCONFIG=	yes

CMAKE_OFF=	ASSIMP_BUILD_TESTS

PLIST_SUB=	SHL3=${DISTVERSION} VER2=${DISTVERSION:R} SHL1=${DISTVERSION:R:R}

post-install: # rm the third-party lib installed by mistake: https://github.com/assimp/assimp/issues/1650
	@${RM} ${STAGEDIR}${PREFIX}/lib/libIrrXML.a
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
