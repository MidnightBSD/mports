# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libtasn1
PORTVERSION=	4.10
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CPE_VENDOR=	gnu

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
