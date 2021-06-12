# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	aspell
PORTVERSION=	0.60.6.1
DISTVERSIONSUFFIX=	-9.el7
PORTREVISION=	1
CATEGORIES=	textproc linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spelling checker with better logic than ispell (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
