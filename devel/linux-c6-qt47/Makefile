# $MidnightBSD$

PORTNAME=	qt47
PORTVERSION=	4.7.2
CATEGORIES=	devel linux
MASTER_SITES=	FREEBSD_LOCAL/tijl/atrpms:amd64,i386
SRC_DISTFILES=	# unavailable
DIST_SUBDIR=	atrpms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

RPMVERSION=	1_18.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	fontconfig png dbuslibs sqlite3 openssl
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
