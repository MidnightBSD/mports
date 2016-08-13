# $MidnightBSD$
# $FreeBSD: head/devel/qt5-help/Makefile 411831 2016-03-25 10:33:07Z rakuco $

PORTNAME=	help
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt online help integration module

LICENSE=	gpl3

USE_QT5=	clucene core gui network sql widgets \
		buildtools_build sql-sqlite3_run
QT_DIST=	tools
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/assistant
INSTALL_WRKSRC=	${WRKSRC}/src/assistant

.include <bsd.port.mk>
