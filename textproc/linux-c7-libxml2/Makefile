# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libxml2
PORTVERSION=	2.9.1
DISTVERSIONSUFFIX=	-6.el7.5
PORTREVISION=	3
CATEGORIES=	textproc linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing XML and HTML support (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
