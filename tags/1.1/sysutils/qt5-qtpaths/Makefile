# $FreeBSD: head/sysutils/qt5-qtpaths/Makefile 378033 2015-01-28 01:15:22Z rakuco $

PORTNAME=	qtpaths
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	sysutils
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line client to QStandardPaths

LICENSE=	gpl3

USE_QT5=	core
QT_DIST=	tools
USES=		qmake

PLIST_FILES=	${QT_BINDIR_REL}/qtpaths

# Similarly to x11/qt5-qev, it makes more sense to just run the build system
# from the qtpaths directory. If we run it from the top of the source tree, it
# will look for a lot more dependencies for other tools such as lupdate, which
# we do not really have to depend on.
WRKSRC=	${WRKDIR}/qttools-opensource-src-5.6.2/src/${PORTNAME}
post-patch:
	${CP} ${WRKSRC}/../../.qmake.conf ${WRKSRC}

.include <bsd.port.mk>
