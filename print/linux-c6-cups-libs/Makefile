# $MidnightBSD$

PORTNAME=	cups
PORTVERSION=	1.4.2
CATEGORIES=	print linux
PKGNAMESUFFIX=	-libs
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System libraries

LICENSE=	gpl2

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
LINUXNAME=	${PORTNAME}${PKGNAMESUFFIX}
RPMVERSION=	79.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	avahi-libs gnutls jpeg png tiff
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
