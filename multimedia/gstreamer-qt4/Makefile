# $MidnightBSD$
# $FreeBSD: ports/multimedia/gstreamer-qt4/Makefile,v 1.3 2011/04/10 08:48:13 makc Exp $

PORTNAME=	gstreamer
PORTVERSION=	0.10.1
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/qt-${PORTNAME}/
PKGNAMESUFFIX=	-qt4
DISTNAME=	qt-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt4 bindings for GStreamer multimedia library
LICENSE=	lgpl

LIB_DEPENDS=	boost_thread:${PORTSDIR}/devel/boost-python

USE_BISON=	build
USE_BZIP2=	yes
USE_CMAKE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GSTREAMER=	yes
USE_GNOME=	glib20
USE_KDE4=	automoc4
USE_QT_VER=	4
QT_COMPONENTS=	corelib gui \
		qmake_build moc_build rcc_build uic_build

PLIST_SUB=	VERSION="${GST_VERSION}"

GST_VERSION=${PORTVERSION:C/..$//}

CMAKE_ARGS+=	\
		-DCMAKE_INCLUDE_PATH:STRING="${LOCALBASE}/include" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="-L${LOCALBASE}/lib" \
		-DCMAKE_MODULE_LINKER_FLAGS:STRING="-L${LOCALBASE}/lib" \
		-DCMAKE_SHARED_LINKER_FLAGS:STRING="-L${LOCALBASE}/lib"

post-extract:
	${REINPLACE_CMD} -e 's|$${LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/src/CMakeLists.txt

.include <bsd.port.mk>
