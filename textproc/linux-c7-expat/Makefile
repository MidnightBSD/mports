# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	expat
PORTVERSION=	2.1.0
DISTVERSIONSUFFIX=	-12.el7
PORTREVISION=	4
CATEGORIES=	textproc linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser written in C (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}2/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
