# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libssh2
PORTVERSION=	1.8.0
DISTVERSIONSUFFIX=	-4.el7
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library implementing the SSH2 protocol (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
