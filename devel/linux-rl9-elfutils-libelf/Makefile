PORTNAME=	elfutils
PORTVERSION=	0.191
DISTVERSIONSUFFIX=	-4.el9
CATEGORIES=	devel linux
PKGNAMESUFFIX=	-libelf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ELF file handling library (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://sourceware.org/elfutils/

LICENSE=        lgpl3 gpl2+ gpl3+
LICENSE_COMB=   multi

USES=		cpe linux:rl9
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

PLIST_SUB=	LIBVERSION=${PORTVERSION}

.include <bsd.port.mk>
