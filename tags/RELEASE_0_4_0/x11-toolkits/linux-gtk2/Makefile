# $MidnightBSD: mports/x11-toolkits/linux-gtk2/Makefile,v 1.5 2008/06/18 04:52:50 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-gtk2/Makefile,v 1.22 2006/07/09 21:01:45 bsam Exp $

PORTNAME=	gtk2
PORTVERSION=	2.6.10
PORTREVISION=	1
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTFILES=	${PORTNAME}-${PORTVERSION}-2.fc4.4.${LINUX_RPM_ARCH}.rpm \
		${PORTNAME}-engines-2.6.3-2.${LINUX_RPM_ARCH}.rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK+ library, version 2.X, Linux binary
LICENSE=	lgpl

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	atk jpeg pango png tiff xorglibs
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST_SUB=	LIBVERSION="600.10" PORTVERSION="${PORTVERSION}"
SRC_DISTFILES=	${PORTNAME}-${PORTVERSION}-2.fc4.4.src.rpm \
		${PORTNAME}-engines-2.6.3-2.src.rpm


.include <bsd.port.mk>
