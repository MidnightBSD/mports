# New ports collection makefile for:	linux libperl
# Date created:			Sun Dec 11 16:38:34 UTC 2005
# Whom:                 Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
# Based on:		emulators/linux_base by marcel@FreeBSD.org and
#			devel/linux-sdl12 by freebsd-emulation@FreeBSD.org
#
# $MidnightBSD$Z
# $FreeBSD: ports/lang/linux-libperl5.8/Makefile,v 1.6 2008/04/19 17:51:30 miwi Exp $
#

PORTNAME=	libperl
PORTVERSION=	5.8.5
CATEGORIES=	lang linux
MASTER_SITES=	ftp://195.220.108.108/linux/conectiva/snapshot/i386/RPMS.extra/
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}${PORTVERSION:R}-${PORTVERSION}-67091cl

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for embedding the perl interpreter (linux version)
LICENSE=	perl

USE_LINUX_RPM=	yes
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64

DIST_SUBDIR=	rpm
PLIST=		${MASTERDIR}/pkg-plist.${LINUX_RPM_ARCH}
SRC_DISTFILES=	# empty, perl is covered by the Artistic License, so this is ok

.include <bsd.port.mk>
