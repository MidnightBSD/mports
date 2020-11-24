# Created by: Alex Dupre <ale@FreeBSD.org>

PORTNAME=	re
DISTVERSION=	v196.04
CATEGORIES=	net
MASTER_SITES=	LOCAL/ale
PKGNAMEPREFIX=	realtek-
PKGNAMESUFFIX=	-kmod
DISTNAME=	rtl_bsd_drv_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel driver for Realtek PCIe Ethernet Controllers

LICENSE=	bsd4

ONLY_FOR_ARCHS=		amd64 i386
ONLY_FOR_ARCHS_REASON=	uses X86-specific code

FAKE_OPTS=	trueprefix

USES=		kmod tar:tgz uidfix

PLIST_FILES=	${KMODDIR}/if_re.ko

pre-install:
	${MKDIR} ${FAKE_DESTDIR}/boot/modules

.include <bsd.port.mk>
