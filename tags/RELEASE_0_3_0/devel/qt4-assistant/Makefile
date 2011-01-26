# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/devel/qt4-assistant/Makefile,v 1.2 2010/01/09 22:53:19 laffer1 Exp $
# $FreeBSD: ports/devel/qt4-assistant/Makefile,v 1.15 2008/08/04 23:30:32 miwi Exp $
#

PORTNAME=	assistant
PORTVERSION=	${QT4_VERSION}
PORTREVISION=	1
CATEGORIES?=	devel
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt documentation browser
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build moc_build rcc_build uic_build qt3support corelib \
		gui network sql xml doc help webkit
QT_NONSTANDARD=	yes
QT_DIST=	yes

HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH ${FAKE_MAKEARGS} destdir=${FAKE_DESTDIR} \
		INSTALL_ROOT=${FAKE_DESTDIR}

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake translations \
		src/dbus src/opengl src/phonon \
		src/qt3support src/script src/svg src/testlib \
		src/tools src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=${WRKDIR}/${DISTNAME}/tools/${PORTNAME}/tools/${PORTNAME}
CONFIGURE_WRKSRC=${WRKSRC}/../../../../
PATCH_WRKSRC=${CONFIGURE_WRKSRC}

pre-configure:
	${CP} ${.CURDIR}/../../devel/qt4/files/configure ${CONFIGURE_WRKSRC}
	${REINPLACE_CMD} \
		-e 's|^TARGET.*|TARGET=assistant-qt4|g' \
		${WRKSRC}/${PORTNAME}.pro
	${MKDIR} ${WRKSRC}/../../../../mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../../../bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/../../../../bin/moc
	${LN} -sf ${LOCALBASE}/bin/uic-qt4 ${WRKSRC}/../../../../bin/uic
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/../../../../bin/rcc

.include <bsd.port.mk>
