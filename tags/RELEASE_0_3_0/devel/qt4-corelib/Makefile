# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/devel/qt4-corelib/Makefile,v 1.5 2009/01/02 01:45:33 ctriv Exp $
# $FreeBSD: ports/devel/qt4-corelib/Makefile,v 1.17 2008/08/05 00:46:16 miwi Exp $
#

PORTNAME=	corelib
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt core library
LICENSE=	gpl2

LIB_DEPENDS=	glib-2.0:${PORTSDIR}/devel/glib20

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build moc_build
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes

HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/lib/qt4


ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH
		
DESTDIRNAME=	INSTALL_ROOT

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/dbus src/gui src/network src/opengl src/phonon \
		src/qt3support src/script src/sql src/svg src/testlib \
		src/tools src/xml src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs src/3rdparty/webkit
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=		${WRKDIR}/${DISTNAME}/src/${PORTNAME}
CONFIGURE_WRKSRC=${WRKSRC}/../../
PATCH_WRKSRC=${CONFIGURE_WRKSRC}

EXTRA_PATCHES=${.CURDIR}/../../devel/qt4/files/extrapatch-configure

.include "${.CURDIR}/../../devel/qt4/files/Makefile.options"

pre-everything::
	@${CAT} ${PKGMESSAGE}

post-patch:
	${REINPLACE_CMD} -e '${QT4_OPTIONS_REPLACE}' ${CONFIGURE_WRKSRC}/configure

pre-configure:
	${MKDIR} ${WRKSRC}/../../mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/../../bin/moc
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/qt4/mkspecs

post-configure:
	${REINPLACE_CMD} -e 's|${PREFIX}/lib/qt4/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		-e 's|.*$$(QMAKE).*||g' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -E -e 's|-L.[^[:space:]]*qt-x11-opensource.[^[:space:]]*lib||g' \
			-E -e 's|(.*location=).*moc|\1${PREFIX}/bin/moc-qt4|g' \
			-E -e 's|(.*location=).*uic|\1${PREFIX}/bin/uic-qt4|g' \
		${WRKSRC}/../../lib/pkgconfig/QtCore.pc

post-install:
	${MKDIR} ${PREFIX}/lib/qt4/plugins
	${MKDIR} ${PREFIX}/share/qt4/mkspecs
	${TOUCH} ${PREFIX}/lib/qt4/plugins/.keep_me
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/mkspecs/qconfig.pri ${PREFIX}/share/qt4/mkspecs/

.include <bsd.port.mk>
