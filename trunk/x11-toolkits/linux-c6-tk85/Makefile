# $MidnightBSD$

PORTNAME=	tk
PORTVERSION=	8.5.7
CATEGORIES=	x11-toolkits linux
PKGNAMESUFFIX=	85

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical toolkit for TCL (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	other

DATADIR=	${PREFIX}/usr/share/tk${PORTVERSION:R}
RPMVERSION=	5.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	yes
USE_LINUX_RPM_BAD_PERMS=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
