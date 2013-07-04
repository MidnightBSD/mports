# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-blt/Makefile,v 1.2 2009/11/25 08:13:10 bsam Exp $

PORTNAME=	blt
PORTVERSION=	2.4
CATEGORIES=	x11-toolkits linux
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BLT widget extension to Tcl/Tk scripting language development (Linux Fedora 10)
LICENSE=	unknown

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	tcl84 tk84 xorglibs
LINUX_DIST_VER=	10
RPMVERSION=	28.z.fc10
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION="${PORTVERSION}" TCLVERSION="8.5"

.include <bsd.port.mk>
