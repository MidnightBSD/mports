# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	gnutls
PORTVERSION=	3.3.29
DISTVERSIONSUFFIX=	-9.el7_6
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	libtasn1 nettle p11-kit trousers
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
