# $MidnightBSD: mports/audio/linux-libaudiofile/Makefile,v 1.2 2008/04/10 04:53:43 ctriv Exp $
# $FreeBSD: ports/audio/linux-libaudiofile/Makefile,v 1.14 2006/07/09 21:01:43 bsam Exp $

PORTNAME=	libaudiofile
PORTVERSION=	0.2.6
PORTREVISION=	1
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	audiofile-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of audiofile
LICENSE=	gpl2

CONFLICTS=	linux-f10-libaudiofile-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	LIBAUDIOFILE_VERSION="${PORTVERSION}"

.include <bsd.port.mk>
