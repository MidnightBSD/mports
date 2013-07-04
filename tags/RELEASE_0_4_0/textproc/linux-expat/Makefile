# $MidnightBSD: mports/textproc/linux-expat/Makefile,v 1.4 2009/06/12 19:36:24 laffer1 Exp $
# $FreeBSD: ports/textproc/linux-expat/Makefile,v 1.14 2006/07/09 21:01:45 bsam Exp $

PORTNAME=	expat
PORTVERSION=	1.95.8
CATEGORIES=	textproc linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	${PORTNAME}-${PORTVERSION}-6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux/i386 binary port of Expat XML-parsing library
LICENSE=	other

CONFLICTS=	linux-f10-expat-[0-9]*

BRANDELF_DIRS=	usr/bin

USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
ONLY_FOR_ARCHS=	i386 amd64
USE_LDCONFIG=	yes
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
