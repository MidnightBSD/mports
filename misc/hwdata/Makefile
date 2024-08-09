PORTNAME=	hwdata
DISTVERSIONPREFIX=	v
DISTVERSION=	0.384
PORTEPOCH=	1
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of IDs used in PCI, PNP and USB devices
WWW=		https://github.com/vcrhonek/hwdata

LICENSE=	gpl2+ mit
LICENSE_COMB=	dual

BUILD_DEPENDS=	ginstall:sysutils/coreutils

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	vcrhonek
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--datadir=${DATADIR}

BINARY_ALIAS=	install=ginstall

NO_ARCH=	yes

.include <bsd.port.mk>
