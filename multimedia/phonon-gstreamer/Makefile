# $MidnightBSD: mports/multimedia/phonon-gstreamer/Makefile,v 1.1 2011/07/23 16:01:16 laffer1 Exp $
# $FreeBSD: ports/multimedia/phonon-gstreamer/Makefile,v 1.13 2011/03/25 10:14:53 avilla Exp $

PORTNAME=	phonon
PORTVERSION=	4.4.4
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${PHONON_BRANCH}/${PORTNAME}/${PORTNAME}-backend${PKGNAMESUFFIX}/${PORTVERSION}/src
PKGNAMESUFFIX=	-gstreamer
DISTNAME=	${PORTNAME}-backend${PKGNAMESUFFIX}-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GStreamer backend for Phonon
LICENSE=	lgpl

CONFLICTS=	qt4-phonon-gst-4*

PHONON_BRANCH=	stable
USE_BZIP2=	yes
USE_CMAKE=	yes
USE_KDE4=	kdehier automoc4 kdeprefix
USE_QT_VER=	4
QT_COMPONENTS=	gui dbus xml opengl phonon \
		qmake_build moc_build rcc_build uic_build
USE_GSTREAMER=	yes

PLIST_SUB+=	QT_PREFIX=${QT_PREFIX}

# Explicitly disable alsa, see for details:
# http://mail.kde.org/pipermail/kde-freebsd/2010-March/008015.html
CMAKE_ARGS+=	-DWITH_Alsa:BOOL=OFF

.if defined(WITH_QT_PHONON)
IGNORE=		conflicts with Qt4 phonon. Please, deinstall qt4-phonon-gst and set WITH_KDE_PHONON to continue
.endif

pre-configure:
	${REINPLACE_CMD} -e 's|{QT_INCLUDES}|{QT_INCLUDES} ${LOCALBASE}/include|'\
		${PATCH_WRKSRC}/CMakeLists.txt

pre-install:
	${MKDIR} ${FAKE_DESTDIR}${QT_PLUGINDIR}/phonon_backend

post-install:
	cd  ${PREFIX}/lib && ${LN} -sf kde4/plugins/phonon_backend/phonon_gstreamer.so qt4/plugins/phonon_backend/libphonon_gstreamer.so

.include <bsd.port.mk>
