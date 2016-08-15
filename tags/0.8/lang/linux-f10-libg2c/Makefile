# $MidnightBSD$
# $FreeBSD: ports/lang/linux-f10-libg2c/Makefile,v 1.8 2011/03/07 15:08:22 ehaupt Exp $

PORTNAME=	libg2c
PORTVERSION=	3.4.6
PORTREVISION=	1
CATEGORIES=	lang linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fortran 77 shared library (Linux Fedora 10)

LICENSE=	gpl2

CONFLICTS=	linux-libg2c-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
LINUX_NAME=	compat-libf2c-34
RPMVERSION=	9
USE_LDCONFIG=	yes
SRC_DISTFILES=	compat-gcc-34-${PORTVERSION}-${RPMVERSION}.src.rpm

PLIST_FILES=	usr/lib/libg2c.so.0 usr/lib/libg2c.so.0.0.0

.include <bsd.port.mk>
