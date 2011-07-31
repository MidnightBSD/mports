# $MidnightBSD: mports/multimedia/phonon/Makefile,v 1.4 2011/07/23 16:00:46 laffer1 Exp $
# $FreeBSD: ports/multimedia/phonon/Makefile,v 1.17 2011/04/07 11:48:18 avilla Exp $

PORTNAME=	phonon
PORTVERSION=	4.5.0
PORTREVISION=	1
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${PHONON_BRANCH}/${PORTNAME}/${PORTVERSION}/src/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multimedia framework for KDE4
LICENSE=	lgpl

CONFLICTS=	qt4-phonon-4*

PHONON_BRANCH=	stable
USE_BZIP2=	yes
USE_CMAKE=	yes
USE_KDE4=	kdehier automoc4 kdeprefix
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui qtestlib \
		qmake_build moc_build rcc_build uic_build
USE_LDCONFIG=	yes

OPTIONS=	PULSEAUDIO	"Support playback via PulseAudio" off
#		DESIGNER	"Install Qt Designer plugin" off \
#		ZEITGEIST	"Log playback activity via Zeitgeist" off

.include <bsd.mport.options.mk>

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

.ifdef(WITH_ZEITGEIST)
CMAKE_ARGS+=	-DWITH_QtZeitgeist:BOOL=ON
.else
CMAKE_ARGS+=	-DWITH_QtZeitgeist:BOOL=OFF
.endif

PLIST_SUB+=	QT_PREFIX=${QT_PREFIX}

.ifdef(WITH_QT_PHONON)
IGNORE=		conflicts with Qt 4 phonon. Please, deinstall qt4-phonon and unset WITH_QT_PHONON to continue
.endif

pre-configure:
	${REINPLACE_CMD} -e '/phonon.pc/s|pkgconfig|../libdata/pkgconfig|' \
		-e 's|{QT_INCLUDES}|{QT_INCLUDES} ${LOCALBASE}/include|'\
		${PATCH_WRKSRC}/CMakeLists.txt

post-install:
	${MKDIR} ${FAKE_DESTDIR}${QT_INCDIR}
	cd ${PREFIX}/include && ${LN} -sf phonon qt4/phonon
	cd ${PREFIX}/include && ${LN} -sf phonon qt4/Phonon
	cd ${PREFIX}/include && ${LN} -sf KDE/Phonon phonon/Phonon
	${MKDIR} ${FAKE_DESTDIR}${QT_LIBDIR}
.for lib in phonon phononexperimental
	cd ${PREFIX}/lib && ${LN} -sf ../lib${lib}.so.4.5.0 qt4/lib${lib}.so
	cd ${PREFIX}/lib && ${LN} -sf ../lib${lib}.so.4.5.0 qt4/lib${lib}.so.4
.endfor

.include <bsd.port.mk>
