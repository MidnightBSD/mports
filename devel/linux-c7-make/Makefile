PORTNAME=	make
PORTVERSION=	3.82
DISTVERSIONSUFFIX=	-24.el7
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU make utility (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl3

USES=		linux:c7
USE_LINUX_RPM=	nolib

DESCR=		${.CURDIR}/../gmake/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
