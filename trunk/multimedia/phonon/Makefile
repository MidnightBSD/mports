# Created by: Martin Wilke <miwi@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/multimedia/phonon/Makefile 375654 2014-12-26 20:05:09Z rakuco $

PORTNAME=	phonon
PORTVERSION=	4.9.1
CATEGORIES=	multimedia
MASTER_SITES=	KDE/stable/${PORTNAME}/${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE multimedia framework

LICENSE=	lgpl2.1

LIB_DEPENDS=	libqzeitgeist.so:sysutils/qzeitgeist

USE_KDE4=	automoc4
USE_QT4=	corelib dbus declarative gui testlib \
		qmake_build moc_build rcc_build uic_build
USES=		cmake tar:xz
CMAKE_ARGS=	-DPHONON_INSTALL_QT_EXTENSIONS_INTO_SYSTEM_QT:BOOL=TRUE \
		-DPHONON_NO_PLATFORMPLUGIN:BOOL=TRUE \
		-DPHONON_BUILD_DESIGNER_PLUGIN:BOOL=OFF
USE_LDCONFIG=	yes

PLIST_SUB=	SHLIB_VER=${PORTVERSION} \
		QT_INCDIR_REL=${QT_INCDIR_REL} \
		QT_LIBDIR_REL=${QT_LIBDIR_REL} \
		QT_MKSPECDIR_REL=${QT_MKSPECDIR_REL}

OPTIONS_DEFINE=	PULSEAUDIO

PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio
PULSEAUDIO_USE=		GNOME=glib20
PULSEAUDIO_CMAKE_ON=	-DWITH_PulseAudio:BOOL=ON
PULSEAUDIO_CMAKE_OFF=	-DWITH_PulseAudio:BOOL=OFF

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${QT_INCDIR}
	${MKDIR} ${FAKE_DESTDIR}${QT_LIBDIR}
post-fake:
	cd ${FAKE_DESTDIR}${LOCALBASE} && ${LN} -sf include/phonon ${QT_INCDIR_REL}/phonon && \
	${LN} -sf include/phonon ${QT_INCDIR_REL}/Phonon
.for lib in phonon phononexperimental
	cd ${FAKE_DESTDIR}/usr/local && ${LN} -sf lib/lib${lib}.so.${PORTVERSION} ${QT_LIBDIR_REL}/lib${lib}.so && \
	${LN} -sf lib/lib${lib}.so.${PORTVERSION} ${QT_LIBDIR_REL}/lib${lib}.so.4
.endfor

.include <bsd.port.mk>
