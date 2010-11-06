# $MidnightBSD: mports/multimedia/kdemultimedia4/Makefile,v 1.2 2010/02/27 23:18:39 laffer1 Exp $

PORTNAME=	kdemultimedia
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	1
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Multimedia applications
LICENSE=	gpl2

OPTIONS=	PULSEAUDIO "KMix control for PulseAudio" off

LIB_DEPENDS=	FLAC.10:${PORTSDIR}/audio/flac \
		cdda_paranoia.0:${PORTSDIR}/audio/cdparanoia \
		ogg.7:${PORTSDIR}/audio/libogg \
		tag.6:${PORTSDIR}/audio/taglib \
		vorbis.4:${PORTSDIR}/audio/libvorbis \
		musicbrainz.4:${PORTSDIR}/audio/libmusicbrainz \
		tunepimp.5:${PORTSDIR}/audio/libtunepimp \
		xine.1:${PORTSDIR}/multimedia/libxine
RUN_DEPENDS=	oggenc:${PORTSDIR}/audio/vorbis-tools
.if !defined(PACKAGE_BUILDING)
RUN_DEPENDS+=	lame:${PORTSDIR}/audio/lame
.endif

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_KDE4=	kdelibs kdeprefix kdehier automoc4 kdeexp
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl dbus qt3support designer network svg qtestlib \
		qmake_build moc_build rcc_build uic_build
USE_OPENLDAP=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_PULSEAUDIO)
CMAKE_ARGS+=  -DWITH_PulseAudio:BOOL=ON
LIB_DEPENDS+= pulse.0:${PORTSDIR}/audio/pulseaudio
.else
CMAKE_ARGS+=  -DWITH_PulseAudio:BOOL=OFF
.endif

CMAKE_ARGS+=  -DWITH_PulseAudio:BOOL=OFF

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.post.mk>
