# $MidnightBSD$
# $FreeBSD: ports/lang/linux-f10-tcl85/Makefile,v 1.6 2011/03/03 09:26:41 ehaupt Exp $

PORTNAME=	tcl
PORTVERSION=	8.5.3
PORTREVISION=	1
CATEGORIES=	lang linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMESUFFIX=	85
PKGNAMEPREFIX=	linux-f10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language (Linux Fedora 10)

LICENSE=	other

CONFLICTS=	linux-c6-tcl85-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
RPMVERSION=	1.fc10
BRANDELF_FILES=	usr/bin/tclsh8.5
USE_LDCONFIG=	yes

DESCR=		${.CURDIR}/../${PORTNAME}${PKGNAMESUFFIX}/pkg-descr

.include <bsd.port.mk>
