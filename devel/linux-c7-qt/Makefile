PORTNAME=	qt
PORTVERSION=	4.8.7
DISTVERSIONSUFFIX=	-9.el7_9
PORTREVISION=	5
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of QT4 (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://qt-project.org

USES=		cpe linux:c7
CPE_VENDOR=	qt
USE_LDCONFIG=	yes
USE_LINUX=	fontconfig dbuslibs imageformats-libs sqlite3
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}47
DATADIR=	${PREFIX}/usr/share/${PORTNAME}4

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
