# New ports collection makefile for: linux-esound
# Date created:		01/09/18
# Whom:                 taoka@FreeBSD.org
#
# $MidnightBSD: mports/audio/linux-esound/Makefile,v 1.1 2007/05/03 06:10:57 laffer1 Exp $
# $FreeBSD: ports/audio/linux-esound/Makefile,v 1.15 2006/11/06 20:58:50 bsam Exp $
#

PORTNAME=	esound
CATEGORIES=	audio linux
PORTVERSION=	0.2.36
DISTNAME=	${PORTNAME}-${PORTVERSION}-0.fc4.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of esound
LICENSE=	gpl2

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libaudiofile.so.0:${PORTSDIR}/audio/linux-libaudiofile

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	ESOUND_VERSION="${PORTVERSION}"

.include <bsd.port.mk>
