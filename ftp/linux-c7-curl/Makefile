# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	curl
PORTVERSION=	7.29.0
DISTVERSIONSUFFIX=	-59.el7_9.1
PORTREVISION=	12
CATEGORIES=	ftp linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for transferring files with URL syntax (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	libssh2 nspr nss openldap
USE_LINUX_RPM=	nolib

LIB_DISTNAMES=	lib${DISTNAME}

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
