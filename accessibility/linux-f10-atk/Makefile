# $MidnightBSD$
# $FreeBSD: ports/accessibility/linux-f10-atk/Makefile,v 1.26 2011/03/07 15:08:15 ehaupt Exp $

PORTNAME=	atk
PORTVERSION=	1.24.0
CATEGORIES=	accessibility linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	emulation@FreeBSD.org
COMMENT=	Accessibility Toolkit, Linux/i386 binary (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-atk-[0-9]* linux-f8-atk-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10
USE_LDCONFIG=	yes

.include <bsd.port.mk>
