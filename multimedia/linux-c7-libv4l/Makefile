# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libv4l
PORTVERSION=	0.9.5
DISTVERSIONSUFFIX=	-4.el7
PORTREVISION=	2
CATEGORIES=	multimedia linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

SRC_DISTFILES=	v4l-utils-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
