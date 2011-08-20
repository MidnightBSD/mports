# $MidnightBSD: mports/benchmarks/dkftpbench/Makefile,v 1.5 2011/02/02 20:05:30 laffer1 Exp $

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
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd6.0

USE_AUTOTOOLS=	automake14 autoconf

.include <bsd.port.mk>
