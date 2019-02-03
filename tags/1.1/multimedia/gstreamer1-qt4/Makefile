# $MidnightBSD$
# $FreeBSD: head/multimedia/gstreamer1-qt4/Makefile 370694 2014-10-12 11:32:20Z makc $

PORTNAME=	gstreamer
PORTVERSION=	1.2.0
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/qt-${PORTNAME}/
PKGNAMESUFFIX=	1-qt4
DISTNAME=	qt-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 4 bindings for GStreamer 1.x multimedia library

LICENSE=	lgpl2.1

LIB_DEPENDS=	libboost_thread.so:${PORTSDIR}/devel/boost-libs

CONFLICTS_INSTALL=	gstreamer-qt4-*

USES=		bison cmake:outsource gmake pkgconfig tar:xz
USE_GSTREAMER1=	yes
USE_QT4=	corelib gui opengl declarative \
		qmake_build moc_build rcc_build uic_build qtestlib_build
USE_LDCONFIG=	yes
CMAKE_ARGS=	-DUSE_GST_PLUGIN_DIR=off \
		-DUSE_QT_PLUGIN_DIR=off

PLIST_SUB=	SHLIB_VER="${PORTVERSION}"

post-patch:
	${REINPLACE_CMD} -e 's|$${CMAKE_INSTALL_LIBDIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
