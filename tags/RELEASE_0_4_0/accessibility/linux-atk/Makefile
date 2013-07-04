# $MidnightBSD: mports/accessibility/linux-atk/Makefile,v 1.7 2011/06/18 02:24:26 laffer1 Exp $

PORTNAME=	atk
PORTVERSION=	1.9.1
PORTREVISION=	2
CATEGORIES=	accessibility linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility Toolkit, Linux/i386 binary
LICENSE=	lgpl

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libglib-2.0.so.0:${PORTSDIR}/devel/linux-glib2

CONFLICTS=	linux-f10-atk-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
PLIST_SUB+=	LIBVERSION="901.0" PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
