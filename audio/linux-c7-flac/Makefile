# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	flac
PORTVERSION=	1.3.0
DISTVERSIONSUFFIX=	-5.el7_1
PORTREVISION=	2
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec (Linux CentOS ${LINUX_DIST_VER})

LICENSE=        bsd3 gpl2 lgpl2.1
LICENSE_COMB=   multi

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	libogg
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
