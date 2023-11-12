PORTNAME=	quazip
DISTVERSIONPREFIX=	v
DISTVERSION=	1.4
CATEGORIES=	archivers
PKGNAMESUFFIX=	-qt5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt/C++ wrapper for ZIP/UNZIP package
WWW=		https://github.com/stachenov/quazip

LICENSE=	lgpl2.1

USES=		cmake compiler:c++11-lang cpe qt:5
CPE_VENDOR=	quazip_project
USE_GITHUB=	yes
GH_ACCOUNT=	stachenov
USE_LDCONFIG=	yes
USE_QT=		core network testlib \
		buildtools:build qmake:build
CMAKE_ARGS=	-DQUAZIP_QT_MAJOR_VERSION=5

PLIST_SUB=	QTVER_SUFFIX=5 \
		QUAZIP_VERSION=${DISTVERSION}

.include <bsd.port.mk>
