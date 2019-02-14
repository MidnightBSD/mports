# $MidnightBSD$

PORTNAME=	atk
PORTVERSION=	2.22.0
CATEGORIES=	accessibility linux

MAINTAINER=	ports@MidightBSD.org
COMMENT=	Accessibility Toolkit (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl3

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	3.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
