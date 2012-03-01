# $MidnightBSD: mports/multimedia/phonon-gstreamer/Makefile,v 1.2 2011/07/24 00:30:38 laffer1 Exp $
# $FreeBSD: ports/multimedia/phonon-gstreamer/Makefile,v 1.13 2011/03/25 10:14:53 avilla Exp $

PORTNAME=	phonon
PORTVERSION=	4.5.1
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${PHONON_BRANCH}/${PORTNAME}/${PORTNAME}-backend${PKGNAMESUFFIX}/${PORTVERSION}/src
PKGNAMESUFFIX=	-gstreamer
DISTNAME=	${PORTNAME}-backend${PKGNAMESUFFIX}-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GStreamer backend for Phonon
LICENSE=	lgpl

LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}

CONFLICTS=	qt4-phonon-gst-4*

PHONON_BRANCH=	stable

USE_GNOME=	glib20 libxml2
USE_GSTREAMER=	yes
USE_KDE4=	kdehier kdeprefix automoc4
USE_QT_VER=	4
QT_COMPONENTS=	gui opengl phonon xml \
		qmake_build moc_build rcc_build uic_build
USE_XORG=	x11
USE_BZIP2=	yes
USE_CMAKE=	yes
MAKE_JOBS_SAFE=	yes

PLIST_SUB+=	QT_PREFIX=${QT_PREFIX}

# FIXME: Remove this in the next release; phonon-gstreamer does not
# depend on ALSA anymore.
# Explicitly disable ALSA, see for details:
# http://mail.kde.org/pipermail/kde-freebsd/2010-March/008015.html
CMAKE_ARGS+=	-DWITH_Alsa:BOOL=OFF

.if defined(WITH_QT_PHONON)
IGNORE=		conflicts with Qt 4 Phonon. Please, deinstall qt4-phonon-gst and unset WITH_QT_PHONON to continue
.endif

OPTIONS=	PLUGINS "Install GStreamer plugins" off

.include <bsd.mport.options.mk>

.if defined(WITH_PLUGINS)
RUN_DEPENDS+=	gstreamer-plugins-all>=0:${PORTSDIR}/multimedia/gstreamer-plugins-all
.else
SUB_FILES=	pkg-message
.endif

pre-install:
	@${MKDIR} ${FAKE_DESTDIR}${QT_PLUGINDIR}/phonon_backend

post-install:
	@cd ${PREFIX}/lib && ${LN} -sf kde4/plugins/phonon_backend/phonon_gstreamer.so qt4/plugins/phonon_backend/libphonon_gstreamer.so

.include <bsd.port.mk>
