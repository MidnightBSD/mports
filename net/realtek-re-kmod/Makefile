PORTNAME=	re
PORTVERSION=	1100.00
DISTVERSIONPREFIX=	v
CATEGORIES=	net
PKGNAMEPREFIX=	realtek-
PKGNAMESUFFIX=	-kmod

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel driver for Realtek PCIe Ethernet Controllers
WWW=		https://github.com/alexdupre/rtl_bsd_drv

LICENSE=	bsd4

FAKE_OPTS=	trueprefix

USES=		kmod tar:tgz uidfix
USE_GITHUB=	yes
GH_ACCOUNT=	alexdupre
GH_PROJECT=	rtl_bsd_drv
GH_TAGNAME=	ea4ed1e

PLIST_FILES=	${KMODDIR}/if_re.ko

pre-install:
	${MKDIR} ${FAKE_DESTDIR}/boot/modules

.include <bsd.port.mk>
