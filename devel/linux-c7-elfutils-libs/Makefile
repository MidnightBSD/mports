PORTNAME=	elfutils
PORTVERSION=	0.176
DISTVERSIONSUFFIX=	-5.el7
PORTREVISION=	2
CATEGORIES=	devel linux
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ELF file handling libraries (CentOS ${LINUX_DIST_VER})

LICENSE=	other

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	elfutils-libelf
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

.include <bsd.port.mk>
