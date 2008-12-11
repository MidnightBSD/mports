#
# $MidnightBSD: ports/x11/qimageblitz/Makefile,v 1.1 2008/08/09 16:52:27 miwi Exp $
#

PORTNAME=	qimageblitz
PORTVERSION=	0.0.4
CATEGORIES=	x11
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE 4 integrated X11 desktop
LICENSE=	bsd2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_QT_VER=	4
QT_COMPONENTS=	qmake moc uic gui rcc
USE_CMAKE=	yes
CMAKE_DEBUG=	yes
CMAKE_VERBOSE=	yes

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e \
	    's,$${LIB_INSTALL_DIR}/pkgconfig,libdata/pkgconfig,' \
	    ${WRKSRC}/blitz/CMakeLists.txt

.include <bsd.port.mk>
