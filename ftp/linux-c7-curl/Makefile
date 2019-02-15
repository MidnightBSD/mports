# $MidnightBSD$

PORTNAME=	curl
PORTVERSION=	7.29.0
CATEGORIES=	ftp linux
LIB_DISTNAMES=	lib${DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for transferring files with URL syntax (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	42.el7_4.1
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	libssh2 nspr nss openldap
USE_LINUX_RPM=	nolib

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
