# $MidnightBSD$

PORTNAME=	qt47-webkit
PORTVERSION=	4.7.2
PORTREVISION=	4
CATEGORIES=	www linux
MASTER_SITES=	FREEBSD_LOCAL/tijl/atrpms:amd64,i386
SRC_DISTFILES=	# unavailable
DIST_SUBDIR=	atrpms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt WebKit implementation (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl3

DESCR=		${.CURDIR}/../../devel/qt4/pkg-descr
RPMVERSION=	1_18.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	fontconfig png xorglibs sqlite3 qt qt-x11
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
