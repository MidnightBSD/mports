PORTNAME=	qtwebkit
PORTVERSION=	2.3.4
DISTVERSIONSUFFIX=	-6.el7
PORTREVISION=	2
CATEGORIES=	www linux
MASTER_SITES=	EPEL7/q

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt WebKit implementation (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://qt-project.org

LICENSE=	gpl3

ONLY_FOR_ARCHS=	aarch64 amd64

USES=		cpe linux:c7
CPE_VENDOR=	qt
USE_LDCONFIG=	yes
USE_LINUX=	fontconfig png xorglibs sqlite3 qt qt-x11
USE_LINUX_RPM=	nolib

CONFLICTS=	linux-c6-qt47-webkit

.include <bsd.port.mk>
