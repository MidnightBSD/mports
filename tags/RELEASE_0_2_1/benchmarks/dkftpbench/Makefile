# New ports collection makefile for:	dkftpbench
# Date created:		2004-10-22
# Whom:			Roman Bogorodskiy <bogorodskiy@inbox.ru>
#
# $MidnightBSD: mports/benchmarks/dkftpbench/Makefile,v 1.2 2007/08/07 00:45:06 laffer1 Exp $
# $FreeBSD: ports/benchmarks/dkftpbench/Makefile,v 1.6 2005/11/15 06:48:10 ade Exp $
#

PORTNAME=	dkftpbench
PORTVERSION=	0.45
PORTREVISION=	2
CATEGORIES=	benchmarks ftp
MASTER_SITES=	http://www.kegel.com/dkftpbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A FTP benchmark program
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0 \
			--host=${MACHINE_ARCH}-portbld-freebsd6.0

USE_AUTOTOOLS=	automake:14 autoconf:261

.include <bsd.port.mk>
