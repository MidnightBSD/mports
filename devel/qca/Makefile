#
# $MidnightBSD: mports/devel/qca/Makefile,v 1.1 2009/01/04 00:39:16 ctriv Exp $
#

PORTNAME=	qca
PORTVERSION=	2.0.0
CATEGORIES=	devel
MASTER_SITES=	http://delta.affinix.com/download/qca/2.0/
DISTNAME=	qca-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform crypto API for QT
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_BZIP2=	yes
USE_CMAKE=	yes
CMAKE_USE_PTHREAD=	yes
USE_QT_VER=	4
QT_COMPONENTS=	qmake gui moc uic rcc qtestlib network
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

CMAKE_ARGS+=	-DQT_QMAKE_EXECUTABLE=${QMAKE}

post-patch:
	${MKDIR} ${WRKSRC}/plugins
	${REINPLACE_CMD} -e \
	's,$${LIB_SUFFIX}/pkgconfig/,data/pkgconfig,' \
	${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
