PORTNAME=	tarsnap-gui
PORTVERSION=	1.0.2
PORTREVISION=	5
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross platform GUI for the Tarsnap command line client
WWW=		https://github.com/Tarsnap/tarsnap-gui/wiki

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	Tarsnap

USES=		compiler:c++11-lib gl qmake qt:5 ssl
USE_QT=		buildtools:build core gui network qmake:build sql sql-sqlite3 widgets
USE_GL=		gl

PLIST_FILES=	bin/tarsnap-gui

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tarsnap-gui ${PREFIX}/bin

.include <bsd.port.mk>
