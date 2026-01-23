PORTNAME=	cups
PORTVERSION=	2.3.3
DISTVERSIONSUFFIX=	op2-34.el9_7
PORTREVISION=	10
CATEGORIES=	print linux
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System libraries
WWW=		https://github.com/OpenPrinting/cups

LICENSE=        Apache-2.0

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	avahi-libs gnutls
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c7-${PORTNAME}${PKGNAMESUFFIX}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

.include <bsd.port.mk>
