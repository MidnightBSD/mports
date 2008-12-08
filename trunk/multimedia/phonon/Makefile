#
# $MidnightBSD: ports/multimedia/phonon/Makefile,v 1.1 2008/08/09 16:52:20 miwi Exp $
#

PORTNAME=	phonon
PORTVERSION=	4.2.0
CATEGORIES=	multimedia kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/phonon/${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE4 phonon applications
LICENSE=	lgpl

CONFLICTS=	qt4-phonon-4*

USE_BZIP2=	yes
USE_KDE4=	kdehier automoc4 kdeprefix
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl moc rcc uic dbus qt3support designer network svg qtestlib
USE_GSTREAMER=	yes

post-extract:
	${MKDIR} ${WRKSRC}

post-patch:
#fix finding automoc when PREFIX is not matched KDE4_PREFIX
	${REINPLACE_CMD} -e 's|NO_DEFAULT_PATH|${KDE4_PREFIX} NO_DEFAULT_PATH|' \
		${WRKSRC}/../cmake/FindAutomoc4.cmake

pre-configure:
	${REINPLACE_CMD} -e '/phonon.pc/s|pkgconfig|../libdata/pkgconfig|' \
			-e 's|{QT_INCLUDES}|{QT_INCLUDES} ${LOCALBASE}/include|'\
		${WRKSRC}/../CMakeLists.txt

.include <bsd.port.mk>
