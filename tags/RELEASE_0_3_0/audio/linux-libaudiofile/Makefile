# New ports collection makefile for: linux-libaudiofile
# Date created:		01/09/18
# Whom:                 taoka@FreeBSD.org
#
# $MidnightBSD: mports/audio/linux-libaudiofile/Makefile,v 1.1 2007/05/03 06:10:57 laffer1 Exp $
# $FreeBSD: ports/audio/linux-libaudiofile/Makefile,v 1.14 2006/07/09 21:01:43 bsam Exp $
#

PORTNAME=	libaudiofile
PORTVERSION=	0.2.6
CATEGORIES=	audio linux
DISTNAME=	audiofile-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of audiofile
LICENSE=	gpl2

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	LIBAUDIOFILE_VERSION="${PORTVERSION}"

.include <bsd.port.mk>
