# $MidnightBSD: mports/benchmarks/dkftpbench/Makefile,v 1.4 2009/06/06 21:18:56 laffer1 Exp $

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

USE_AUTOTOOLS=	automake14 autoconf

.include <bsd.port.mk>
