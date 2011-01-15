#
# $MidnightBSD: mports/multimedia/phonon/Makefile,v 1.2 2010/12/29 01:17:13 laffer1 Exp $
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

BROKEN=		not picking up rules in  cmake file properly.

CONFLICTS=	qt4-phonon-4*

USE_BZIP2=	yes
USE_KDE4=	kdehier automoc4 kdeprefix
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl moc rcc uic dbus qt3support designer network svg qtestlib
USE_GSTREAMER=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/${PORTNAME}
CMAKE_ARGS+=	-Wno-dev

post-extract:
	${MKDIR} ${WRKSRC}

pre-configure:
	${REINPLACE_CMD} -e '/phonon.pc/s|pkgconfig|../libdata/pkgconfig|' \
			-e 's|{QT_INCLUDES}|{QT_INCLUDES} ${LOCALBASE}/include|'\
		${WRKSRC}/../CMakeLists.txt

.include <bsd.port.mk>
