# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/graphics/qt4-iconengines/Makefile,v 1.1 2008/10/09 20:31:36 laffer1 Exp $
# $FreeBSD: ports/graphics/qt4-iconengines/Makefile,v 1.12 2008/08/04 23:30:35 miwi Exp $
#

PORTNAME=	iconengines
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	graphics
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SVG icon engine plugin
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build moc_build corelib gui svg xml
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes
HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH ${FAKE_MAKEARGS} destdir=${FAKE_DESTDIR} \
		INSTALL_ROOT=${FAKE_DESTDIR}

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/dbus src/network src/opengl src/phonon \
		src/qt3support src/script src/sql src/testlib \
		src/tools src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs src/3rdparty/webkit
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=		${WRKDIR}/${DISTNAME}/src/plugins/iconengines/svgiconengine
CONFIGURE_WRKSRC=${WRKSRC}/../../../..

pre-configure:
	${CP} ${.CURDIR}/../../devel/qt4/files/configure ${CONFIGURE_WRKSRC}
	${MKDIR} ${WRKSRC}/../../../../mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../../../bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/../../../../bin/moc

.include <bsd.port.mk>
