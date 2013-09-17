# $MidnightBSD$

PORTNAME=	scim-gtk
PORTVERSION=	1.4.7
PORTREVISION=	1
CATEGORIES=	textproc linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smart Common Input Method platform, gtk module, (Linux Fedora 10)

LICENSE=	unknown

CONFLICTS=	linux-scim-gtk-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	gtk2 scimlibs
LINUX_DIST_VER=	10
RPMVERSION=	35.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	scim-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}

.include <bsd.port.mk>
