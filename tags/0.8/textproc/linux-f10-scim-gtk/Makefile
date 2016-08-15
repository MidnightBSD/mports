# $MidnightBSD$

PORTNAME=	scim-gtk
PORTVERSION=	1.4.7
PORTREVISION=	2
CATEGORIES=	textproc linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smart Common Input Method platform, gtk module, (Linux Fedora 10)

LICENSE=	unknown

CONFLICTS=	linux-scim-gtk-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	gtk2 scimlibs

RPMVERSION=	35.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	scim-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}

.include <bsd.port.mk>
