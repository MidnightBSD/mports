# $MidnightBSD: mports/benchmarks/dkftpbench/Makefile,v 1.3 2008/03/23 20:23:31 laffer1 Exp $

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

USE_AUTOTOOLS=	automake:14 autoconf:262

.include <bsd.port.mk>
