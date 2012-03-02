# $MidnightBSD: mports/multimedia/phonon/Makefile,v 1.5 2011/07/31 20:39:28 laffer1 Exp $
# $FreeBSD: ports/multimedia/phonon/Makefile,v 1.17 2011/04/07 11:48:18 avilla Exp $

PORTNAME=	phonon
PORTVERSION=	4.5.1
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${PHONON_BRANCH}/${PORTNAME}/${PORTVERSION}/src/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multimedia framework for KDE4
LICENSE=	lgpl

LIB_DEPENDS=	qzeitgeist.0:${PORTSDIR}/sysutils/qzeitgeist

CONFLICTS=	qt4-phonon-4*

PHONON_BRANCH=	stable

USE_KDE4=	kdehier kdeprefix automoc4
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui \
		qmake_build moc_build rcc_build uic_build
USE_XZ=		yes
USE_CMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

OPTIONS=	PULSEAUDIO	"Support playback via PulseAudio" off
#		DESIGNER	"Install Qt Designer plugin" off \

.include <bsd.mport.options.mk>

# FIXME: Enable this option with Qt 4.8 (qt4-webkit does not depend on
# phonon anymore).
# qt4-designer depends on qt4-webkit, hence on phonon. Disable this
# option to avoid a circular dependency.
.undef WITH_DESIGNER
.ifdef(WITH_DESIGNER)
QT_COMPONENTS+=	designer
CMAKE_ARGS+=	-DPHONON_BUILD_DESIGNER_PLUGIN:BOOL=ON
PLIST_SUB+=	DESIGNER=""
.else
CMAKE_ARGS+=	-DPHONON_BUILD_DESIGNER_PLUGIN:BOOL=OFF
PLIST_SUB+=	DESIGNER="@comment "
.endif

.ifdef(WITH_PULSEAUDIO)
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
USE_GNOME+=	glib20
CMAKE_ARGS+=	-DWITH_PulseAudio:BOOL=ON
.else
CMAKE_ARGS+=	-DWITH_PulseAudio:BOOL=OFF
.endif

PLIST_SUB+=	QT_PREFIX=${QT_PREFIX}

.ifdef(WITH_QT_PHONON)
IGNORE=		conflicts with Qt 4 phonon. Please, deinstall qt4-phonon and unset WITH_QT_PHONON to continue
.endif

pre-configure:
	${REINPLACE_CMD} -e '/phonon.pc/s|pkgconfig|../libdata/pkgconfig|' \
		-e 's|{QT_INCLUDES}|{QT_INCLUDES} ${LOCALBASE}/include|'\
		${PATCH_WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e '/add_subdirectory(tests)/ d' \
		${PATCH_WRKSRC}/${PORTNAME}/experimental/CMakeLists.txt

# FIXME: We need to pass -DPHONON_INSTALL_QT_EXTENSIONS_INTO_SYSTEM_QT=1
# to install the designer plugin and the Qt .pri file into the
# system-wide Qt directory in the next release.
# Reference: http://commits.kde.org/phonon/664035456f0c9dc85b65c893f431b82118c281c0
post-install:
	${MKDIR} ${FAKE_DESTDIR}${QT_INCDIR}
	cd ${PREFIX}/include && ${LN} -sf phonon qt4/phonon
	cd ${PREFIX}/include && ${LN} -sf phonon qt4/Phonon
	cd ${PREFIX}/include && ${LN} -sf KDE/Phonon phonon/Phonon
	${MKDIR} ${FAKE_DESTDIR}${QT_LIBDIR}
.for lib in phonon phononexperimental
	cd ${PREFIX}/lib && ${LN} -sf ../lib${lib}.so.4.5.1 qt4/lib${lib}.so
	cd ${PREFIX}/lib && ${LN} -sf ../lib${lib}.so.4.5.1 qt4/lib${lib}.so.4
.endfor

.include <bsd.port.mk>
