# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libvorbis
PORTVERSION=	1.3.3
DISTVERSIONSUFFIX=	-8.el7.1
PORTREVISION=	2
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	bsd3

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	libogg
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
