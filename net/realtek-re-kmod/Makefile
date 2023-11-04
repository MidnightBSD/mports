PORTNAME=	re
PORTVERSION=	198.00
DISTVERSIONPREFIX=	v
PORTREVISION=	3
CATEGORIES=	net
PKGNAMEPREFIX=	realtek-
PKGNAMESUFFIX=	-kmod

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel driver for Realtek PCIe Ethernet Controllers
WWW=		https://github.com/alexdupre/rtl_bsd_drv

LICENSE=	bsd4

ONLY_FOR_ARCHS=		amd64 i386
ONLY_FOR_ARCHS_REASON=	uses X86-specific code

FAKE_OPTS=	trueprefix

USES=		kmod tar:tgz uidfix
USE_GITHUB=   yes
GH_ACCOUNT=   alexdupre
GH_PROJECT=   rtl_bsd_drv
GH_TAGNAME=   d3a7a3d

PLIST_FILES=	${KMODDIR}/if_re.ko

pre-install:
	${MKDIR} ${FAKE_DESTDIR}/boot/modules

.include <bsd.port.mk>
