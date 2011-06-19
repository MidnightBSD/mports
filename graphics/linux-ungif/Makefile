# $MidnightBSD: mports/graphics/linux-ungif/Makefile,v 1.2 2009/03/21 16:07:29 laffer1 Exp $

PORTNAME=	ungif
PORTVERSION=	4.1.3
PORTREVISION=	2
CATEGORIES=	graphics linux
DISTNAME=	libungif-${PORTVERSION}-3.fc4.2

MAINTAINTER=	ports@MidnightBSD.org
COMMENT=	RPM of the ungif lib
LICENSE=	unknown

CONFLICTS=	linux-f10-ungif-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
