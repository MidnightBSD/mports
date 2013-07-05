# $MidnightBSD: mports/x11-toolkits/attica/Makefile,v 1.2 2012/03/02 01:19:49 laffer1 Exp $

PORTNAME=	attica
PORTVERSION=	0.4.2
PORTEPOCH=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Collaboration Services API library

LICENSE=	lgpl

USE_QT4=	network qtestlib_build xml \
		moc_build qmake_build rcc_build uic_build
USE_BZIP2=	yes
USE_LDCONFIG=	yes
USES=		cmake
CMAKE_ARGS=	-DATTICA_ENABLE_TESTS:BOOL=OFF \
		-DQT4_BUILD:BOOL=ON
MAKE_JOBS_SAFE=	yes

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} \
		-e 's,$${LIB_DESTINATION}/pkgconfig,libdata/pkgconfig,' \
		-e 's,.$${CMAKE_LIBATTICA_VERSION_MINOR},,' \
		${WRKSRC}/lib/CMakeLists.txt

.include <bsd.port.mk>
