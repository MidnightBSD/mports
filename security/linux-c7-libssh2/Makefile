# $MidnightBSD$

PORTNAME=	libssh2
PORTVERSION=	1.4.3
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library implementing the SSH2 protocol (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	bsd2

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	10.el7_2.1
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	openssl
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
