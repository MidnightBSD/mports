# New ports collection makefile for: linux-imlib
# Date created:		01/09/18
# Whom:                 taoka@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-imlib/Makefile,v 1.12 2006/07/09 21:01:44 bsam Exp $
#

PORTNAME=	imlib
PORTVERSION=	1.9.13
PORTREVISION=	2
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-24

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of imlib

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
