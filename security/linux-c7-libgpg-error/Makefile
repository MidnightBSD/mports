# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libgpg-error
PORTVERSION=	1.12
DISTVERSIONSUFFIX=	-3.el7
PORTREVISION=	2
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
