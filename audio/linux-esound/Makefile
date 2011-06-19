# $MidnightBSD: mports/audio/linux-esound/Makefile,v 1.3 2010/02/27 20:08:47 laffer1 Exp $
# $FreeBSD: ports/audio/linux-esound/Makefile,v 1.15 2006/11/06 20:58:50 bsam Exp $

PORTNAME=	esound
PORTVERSION=	0.2.36
PORTREVISION=	1
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	${PORTNAME}-${PORTVERSION}-0.fc4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of esound
LICENSE=	gpl2

CONFLICTS=	linux-f10-esound-[0-9]*

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	libaudiofile
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	ESOUND_VERSION="${PORTVERSION}"

.include <bsd.port.mk>
