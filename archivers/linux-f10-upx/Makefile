# $MidnightBSD$
# $FreeBSD: ports/archivers/linux-f10-upx/Makefile,v 1.7 2011/03/03 09:26:34 ehaupt Exp $

PORTNAME=		upx
PORTVERSION=		3.03
CATEGORIES=		archivers linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=		linux-f10-
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		UPX, a high-performance executable packer (Linux Fedora 10)
LICENSE=		gpl2

CONFLICTS=		linux-upx-[0-9]*

USE_LINUX_RPM=		yes
USE_LINUX_APPS=		ucl
LINUX_DIST_VER=		10
RPMVERSION=		1.fc10
BRANDELF_FILES=		usr/bin/upx

PLIST_FILES=		usr/bin/upx usr/share/man/man1/upx.1.gz
DOCSDIR=		${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=		BUGS COPYING LICENSE NEWS PROJECTS README README.1ST \
			THANKS TODO elf-to-mem.txt filter.txt loader.txt selinux.txt
DESCR=			${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
