# $MidnightBSD: mports/x11/qimageblitz/Makefile,v 1.2 2010/12/29 02:01:21 laffer1 Exp $

PORTNAME=	qimageblitz
PORTVERSION=	0.0.6
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical effects and filters library for KDE4
LICENSE=	bsd2

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_QT_VER=	4
QT_COMPONENTS=	gui qmake_build moc_build uic_build rcc_build
USE_CMAKE=	yes
CMAKE_DEBUG=	yes
CMAKE_VERBOSE=	yes

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e \
		's,$${LIB_INSTALL_DIR}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/blitz/CMakeLists.txt

.include <bsd.port.mk>
