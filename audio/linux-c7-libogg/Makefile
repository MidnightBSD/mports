# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libogg
PORTVERSION=	1.3.0
DISTVERSIONSUFFIX=	-7.el7
PORTREVISION=	1
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	bsd3

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
