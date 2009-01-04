#
# $MidnightBSD: ports/multimedia/kdemultimedia4/Makefile,v 1.143 2008/09/03 13:06:19 miwi Exp $
#

PORTNAME=	kdemultimedia
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Multimedia applications
LICENSE=	gpl2

LIB_DEPENDS+=	audiofile:${PORTSDIR}/audio/libaudiofile \
		FLAC:${PORTSDIR}/audio/flac \
		cdda_paranoia:${PORTSDIR}/audio/cdparanoia \
		ogg:${PORTSDIR}/audio/libogg \
		tag:${PORTSDIR}/audio/taglib \
		theora:${PORTSDIR}/multimedia/libtheora \
		vorbis:${PORTSDIR}/audio/libvorbis \
		mp3lame:${PORTSDIR}/audio/lame \
		tunepimp.5:${PORTSDIR}/audio/libtunepimp \
		xine.1:${PORTSDIR}/multimedia/libxine
RUN_DEPENDS=	oggenc:${PORTSDIR}/audio/vorbis-tools

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_KDE4=	kdelibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl moc rcc uic dbus qt3support designer network svg qtestlib
USE_OPENLDAP=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
CMAKE_USE_PTHREAD+= yes
.endif

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.post.mk>
