PORTNAME=	elfutils
PORTVERSION=	0.191
DISTVERSIONSUFFIX=	-4.el9
PORTREVISION=	1
CATEGORIES=	devel linux
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ELF file handling libraries (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://sourceware.org/elfutils/

LICENSE=	lgpl+ lgpl3+ gpl3+
LICENSE_COMB=	multi

SKIP_FAKE_ALL=  yes

USES=		cpe linux:rl9
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes
USE_LINUX=	elfutils-libelf
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL} \
		${PORTNAME}-debuginfod-client-${DISTVERSIONFULL}

PLIST_SUB=	LIBVERSION=${PORTVERSION}

.include <bsd.port.mk>
