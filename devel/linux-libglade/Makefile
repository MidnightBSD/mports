# New ports collection makefile for: linux-libglade
# Date created:		2001.02.08
# Whom:                 taoka@FreeBSD.org
#
# $MidnightBSD: mports/devel/linux-libglade/Makefile,v 1.1 2006/10/01 17:01:49 laffer1 Exp $
# $FreeBSD: ports/devel/linux-libglade/Makefile,v 1.13 2006/07/09 21:01:44 bsam Exp $
#

PORTNAME=	libglade
PORTVERSION=	0.17
PORTREVISION=	1
CATEGORIES=	devel linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-16

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of libglade
LICENSE=	gpl2

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB=	LIBVERSION="0.4.2" PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
